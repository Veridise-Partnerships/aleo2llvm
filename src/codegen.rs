use crate::finalize::Command;
use inkwell::builder::Builder;
use inkwell::context::Context;
use inkwell::module::Linkage;
use inkwell::module::Module;
use inkwell::types::{BasicMetadataTypeEnum, BasicType, BasicTypeEnum};
use inkwell::values::{
    BasicMetadataValueEnum, BasicValueEnum, FunctionValue, IntValue, PointerValue,
};
use inkwell::IntPredicate;
use serde::Serialize;
use snarkvm_console_network::*;
use snarkvm_console_program::Literal::*;
use snarkvm_console_program::PlaintextType::*;
use snarkvm_console_program::ValueType::*;
use snarkvm_console_program::*;
use snarkvm_synthesizer::finalize::Finalize;
use snarkvm_synthesizer::program::*;
use snarkvm_synthesizer::Opcode::*;
use std::collections::HashMap;
use std::string::String;

#[macro_export]
macro_rules! denote_operand {
    ($op: expr, $registers:expr, $builder:expr, $context:expr, $program:expr) => {
        match $op {
            Operand::Register(Register::Locator(variable)) => {
                let ptr = match $registers.get(&($op).to_string()) {
                    Some(ptr) => ptr,
                    None => {
                        // it is not allaowed to use a variable before it is defined
                        panic!("Variable {} is not defined", variable)
                    }
                };
                let val = $builder.build_load(*ptr, "load");
                val
            }
            Operand::Register(Register::Member(id, member)) => {
                let name = format!("r{}", id.to_string());
                let mut ptr = *$registers.get(&name).unwrap();
                // handle nested member
                for m in member {
                    let ptr_value = $builder.build_load(ptr, "load");
                    let ptr_base = ptr_value.into_struct_value();
                    let struct_name = ptr_base.get_type();
                    let struct_name = struct_name.get_name().unwrap().to_str().unwrap();
                    let prog_struct_type =
                        $program.get_record(&Identifier::try_from(struct_name).unwrap());
                    let prog_struct_type1 =
                        $program.get_struct(&Identifier::try_from(struct_name).unwrap());

                    // note that the first field is the owner address
                    let selector = match prog_struct_type {
                        Ok(_) => true,
                        Err(_) => false,
                    };

                    let index = if m.to_string().eq("owner") {
                        0
                    } else {
                        if (selector) {
                            prog_struct_type
                                .unwrap()
                                .entries()
                                .iter()
                                .find_position(|(e, _)| e.to_string().eq(m.to_string().as_str()))
                                .unwrap()
                                .0
                                + 1
                        } else {
                            prog_struct_type1
                                .unwrap()
                                .members()
                                .iter()
                                .find_position(|(e, _)| e.to_string().eq(m.to_string().as_str()))
                                .unwrap()
                                .0
                                + 1
                        }
                    };

                    let ptr_build: PointerValue =
                        $builder.build_struct_gep(ptr, index as u32, "gep").unwrap();
                    ptr = ptr_build;
                }
                let val = $builder.build_load(ptr, "load");
                val
            }
            Operand::Literal(constant) => match constant {
                I8(c) => $context
                    .i8_type()
                    .const_int(*c.deref() as u64, false)
                    .into(),
                I16(c) => $context
                    .i16_type()
                    .const_int(*c.deref() as u64, false)
                    .into(),
                I32(c) => $context
                    .i32_type()
                    .const_int(*c.deref() as u64, false)
                    .into(),
                I64(c) => $context
                    .i64_type()
                    .const_int(*c.deref() as u64, false)
                    .into(),
                I128(c) => $context
                    .i128_type()
                    .const_int(*c.deref() as u64, false)
                    .into(),
                U8(c) => $context
                    .i8_type()
                    .const_int(*c.deref() as u64, false)
                    .into(),
                U16(c) => $context
                    .i16_type()
                    .const_int(*c.deref() as u64, false)
                    .into(),
                U32(c) => $context
                    .i32_type()
                    .const_int(*c.deref() as u64, false)
                    .into(),
                U64(c) => $context
                    .i64_type()
                    .const_int(*c.deref() as u64, false)
                    .into(),
                U128(c) => $context
                    .i128_type()
                    .const_int(*c.deref() as u64, false)
                    .into(),
                Boolean(b) => $context
                    .bool_type()
                    .const_int(if **b { 1 } else { 0 }, false)
                    .into(),
                // only support field element < 2^64
                Field(a) => $context
                    .i64_type()
                    .const_int(a.to_bigint().as_ref()[0], false)
                    .into(),
                // TODO: use zero as the default value
                Address(a) => $context.i128_type().const_int(0, false).into(),
                Scalar(c) => $context
                    .i128_type()
                    .const_int(c.to_bigint().as_ref()[0], false)
                    .into(),
                _ => panic!("Unsupported constant type"),
            },
            Operand::Caller => {
                let ptr = $registers.get("self.caller").unwrap();
                let val = $builder.build_load(*ptr, "load");
                val
            }
            _ => panic!("Unsupported operand"),
        }
    };
}

pub struct CodeGen<'ctx> {
    pub context: &'ctx Context,
    pub module: Module<'ctx>,
    pub builder: Builder<'ctx>,
    pub program: &'ctx Program<Testnet3>,
    pub registers: HashMap<std::string::String, PointerValue<'ctx>>,
    pub mappings: HashMap<std::string::String, PointerValue<'ctx>>,
    pub summary: Vec<(
        String,
        Vec<(String, String, u32)>,
        Vec<(String, String, u32)>,
        Vec<(String, String, u32)>,
    )>,
}

impl<'ctx> CodeGen<'ctx> {
    pub fn build_function(
        &self,
        name: &str,
        args: &[BasicMetadataTypeEnum<'ctx>],
        ret_ty: BasicTypeEnum<'ctx>,
    ) -> FunctionValue<'ctx> {
        let fn_type = ret_ty.fn_type(args, false);
        let function = self.module.add_function(name, fn_type, None);
        let basic_block = self.context.append_basic_block(function, "entry");
        self.builder.position_at_end(basic_block);
        return function;
    }

    pub fn build_return(&self, value: BasicValueEnum<'ctx>) {
        self.builder.build_return(Some(&value));
    }

    pub fn build_return_void(&self) {
        self.builder.build_return(None);
    }

    pub fn build_int_add(
        &self,
        lhs: IntValue<'ctx>,
        rhs: IntValue<'ctx>,
        name: &str,
    ) -> IntValue<'ctx> {
        return self.builder.build_int_add(lhs, rhs, name);
    }

    pub fn build_int_sub(
        &self,
        lhs: IntValue<'ctx>,
        rhs: IntValue<'ctx>,
        name: &str,
    ) -> IntValue<'ctx> {
        return self.builder.build_int_sub(lhs, rhs, name);
    }

    pub fn build_int_mul(
        &self,
        lhs: IntValue<'ctx>,
        rhs: IntValue<'ctx>,
        name: &str,
    ) -> IntValue<'ctx> {
        return self.builder.build_int_mul(lhs, rhs, name);
    }

    pub fn build_int_div(
        &self,
        lhs: IntValue<'ctx>,
        rhs: IntValue<'ctx>,
        name: &str,
    ) -> IntValue<'ctx> {
        return self.builder.build_int_signed_div(lhs, rhs, name);
    }

    pub fn build_int_rem(
        &self,
        lhs: IntValue<'ctx>,
        rhs: IntValue<'ctx>,
        name: &str,
    ) -> IntValue<'ctx> {
        return self.builder.build_int_signed_rem(lhs, rhs, name);
    }

    pub fn build_int_neg(&self, value: IntValue<'ctx>, name: &str) -> IntValue<'ctx> {
        return self.builder.build_int_neg(value, name);
    }

    pub fn build_int_and(
        &self,
        lhs: IntValue<'ctx>,
        rhs: IntValue<'ctx>,
        name: &str,
    ) -> IntValue<'ctx> {
        return self.builder.build_and(lhs, rhs, name);
    }

    pub fn build_int_or(
        &self,
        lhs: IntValue<'ctx>,
        rhs: IntValue<'ctx>,
        name: &str,
    ) -> IntValue<'ctx> {
        return self.builder.build_or(lhs, rhs, name);
    }

    pub fn build_int_xor(
        &self,
        lhs: IntValue<'ctx>,
        rhs: IntValue<'ctx>,
        name: &str,
    ) -> IntValue<'ctx> {
        return self.builder.build_xor(lhs, rhs, name);
    }

    pub fn build_int_shl(
        &self,
        lhs: IntValue<'ctx>,
        rhs: IntValue<'ctx>,
        name: &str,
    ) -> IntValue<'ctx> {
        return self.builder.build_left_shift(lhs, rhs, name);
    }

    pub fn build_int_shr(
        &self,
        lhs: IntValue<'ctx>,
        rhs: IntValue<'ctx>,
        name: &str,
    ) -> IntValue<'ctx> {
        return self.builder.build_right_shift(lhs, rhs, false, name);
    }

    pub fn build_int_eq(
        &self,
        lhs: IntValue<'ctx>,
        rhs: IntValue<'ctx>,
        name: &str,
    ) -> IntValue<'ctx> {
        return self
            .builder
            .build_int_compare(IntPredicate::EQ, lhs, rhs, name);
    }

    pub fn build_int_ne(
        &self,
        lhs: IntValue<'ctx>,
        rhs: IntValue<'ctx>,
        name: &str,
    ) -> IntValue<'ctx> {
        return self
            .builder
            .build_int_compare(IntPredicate::NE, lhs, rhs, name);
    }

    pub fn build_int_lt(
        &self,
        lhs: IntValue<'ctx>,
        rhs: IntValue<'ctx>,
        name: &str,
    ) -> IntValue<'ctx> {
        return self
            .builder
            .build_int_compare(IntPredicate::SLT, lhs, rhs, name);
    }

    pub fn build_int_le(
        &self,
        lhs: IntValue<'ctx>,
        rhs: IntValue<'ctx>,
        name: &str,
    ) -> IntValue<'ctx> {
        return self
            .builder
            .build_int_compare(IntPredicate::SLE, lhs, rhs, name);
    }

    pub fn build_int_gt(
        &self,
        lhs: IntValue<'ctx>,
        rhs: IntValue<'ctx>,
        name: &str,
    ) -> IntValue<'ctx> {
        return self
            .builder
            .build_int_compare(IntPredicate::SGT, lhs, rhs, name);
    }

    pub fn build_int_ge(
        &self,
        lhs: IntValue<'ctx>,
        rhs: IntValue<'ctx>,
        name: &str,
    ) -> IntValue<'ctx> {
        return self
            .builder
            .build_int_compare(IntPredicate::SGE, lhs, rhs, name);
    }

    pub fn build_ternary(
        &self,
        condition: IntValue<'ctx>,
        then_value: IntValue<'ctx>,
        else_value: IntValue<'ctx>,
        name: &str,
    ) -> IntValue<'ctx> {
        // if condition is not boolean, then it is casted to boolean
        let mut condition = condition;
        if condition.get_type() != self.context.bool_type() {
            condition = self.builder.build_int_compare(
                IntPredicate::NE,
                condition,
                condition.get_type().const_zero(),
                "cast_bool",
            );
        }

        return self
            .builder
            .build_select(condition, then_value, else_value, name)
            .into_int_value();
    }

    pub fn denote_basic_type(&self, ty: &PlaintextType<Testnet3>) -> BasicMetadataTypeEnum<'ctx> {
        match ty {
            PlaintextType::Literal(ty) => (match ty {
                LiteralType::Boolean => self.context.bool_type(),
                LiteralType::I8 => self.context.i8_type(),
                LiteralType::I16 => self.context.i16_type(),
                LiteralType::I32 => self.context.i32_type(),
                LiteralType::I64 => self.context.i64_type(),
                LiteralType::I128 => self.context.i128_type(),
                // TODO: create a new type for unsigned integers
                LiteralType::U8 => self.context.i8_type(),
                LiteralType::U16 => self.context.i16_type(),
                LiteralType::U32 => self.context.i32_type(),
                LiteralType::U64 => self.context.i64_type(),
                LiteralType::U128 => self.context.i128_type(),
                LiteralType::Field => self.context.i128_type(),
                LiteralType::Group => self.context.i128_type(),
                LiteralType::Address => self.context.i128_type(),
                _ => panic!("Unsupported literal type"),
            })
            .into(),
            Struct(ty) => {
                let record = self.program.get_struct(ty).unwrap();
                let record_name = record.name().to_string();
                // create a new struct type if it does not exist
                if !self.context.get_struct_type(&record_name).is_some() {
                    let mut field_types = Vec::new();
                    // first field is the address of the record
                    field_types.push(self.context.i128_type().into());
                    for (_, ty) in record.members() {
                        let field_type = self.denote_basic_type(ty);
                        field_types.push(field_type.try_into().unwrap());
                    }
                    let struct_type = self.context.opaque_struct_type(&record_name);
                    struct_type.set_body(&field_types, false);
                }
                self.context.get_struct_type(&record_name).unwrap().into()
            }
        }
    }

    // 0: unknown, 1: public, 2: private
    pub fn denote_type(&self, ty: &ValueType<Testnet3>) -> (BasicMetadataTypeEnum<'ctx>, u32) {
        match ty {
            Constant(ty) => (self.denote_basic_type(&ty), 0),
            Public(ty) => (self.denote_basic_type(&ty), 1),
            Private(ty) => (self.denote_basic_type(&ty), 2),
            Record(ty) => {
                let record = self.program.get_record(ty).unwrap();
                let record_name = record.name().to_string();
                // create a new struct type if it does not exist
                if !self.context.get_struct_type(&record_name).is_some() {
                    let mut field_types = Vec::new();
                    // first field is the address of the record
                    field_types.push(self.context.i128_type().into());
                    for (_, ty) in record.entries() {
                        let ty_in = match ty {
                            EntryType::Constant(ty) => ty,
                            EntryType::Public(ty) => ty,
                            EntryType::Private(ty) => ty,
                        };
                        let field_type = self.denote_basic_type(ty_in);
                        field_types.push(field_type.try_into().unwrap());
                    }
                    let struct_type = self.context.opaque_struct_type(&record_name);
                    struct_type.set_body(&field_types, false);
                }
                (
                    self.context.get_struct_type(&record_name).unwrap().into(),
                    if record.owner().is_public() { 1 } else { 2 },
                )
            }
            ExternalRecord(ty) => {
                panic!("ExternalRecord type not implemented")
            }
        }
    }

    pub fn denote_instruction(
        &mut self,
        function_name: std::string::String,
        opcode: Opcode,
        operands: &[Operand<Testnet3>],
        destinations: &[Register<Testnet3>],
        register_type: Option<RegisterType<Testnet3>>,
        operator: Option<&CallOperator<Testnet3>>,
    ) {
        // println!(" = {} {:?}", opcode, operands);
        // denote the operands to their LLVM values
        let operands_denote = operands
            .iter()
            .map(|dest| {
                denote_operand!(
                    dest,
                    self.registers,
                    self.builder,
                    self.context,
                    self.program
                )
            })
            .collect::<Vec<BasicValueEnum<'ctx>>>();

        match opcode {
            Opcode::Literal(op) => {
                if op.eq("add") {
                    // load lhs and rhs values
                    let lhs_value = operands_denote[0];
                    let rhs_value = operands_denote[1];

                    // add lhs and rhs values
                    let result = self.build_int_add(
                        lhs_value.into_int_value(),
                        rhs_value.into_int_value(),
                        "add",
                    );

                    // store result in destination
                    let dest = match self.registers.get(&destinations[0].to_string()) {
                        Some(ptr) => ptr,
                        None => {
                            // allocate a new register
                            let ptr = self
                                .builder
                                .build_alloca(lhs_value.get_type(), &destinations[0].to_string());
                            self.registers.insert(destinations[0].to_string(), ptr);
                            self.registers.get(&destinations[0].to_string()).unwrap()
                        }
                    };
                    self.builder.build_store(*dest, result);
                } else if op.eq("sub") {
                    // load lhs and rhs values
                    let lhs_value = operands_denote[0];
                    let rhs_value = operands_denote[1];

                    // add lhs and rhs values
                    let result = self.build_int_sub(
                        lhs_value.into_int_value(),
                        rhs_value.into_int_value(),
                        "sub",
                    );

                    // store result in destination
                    let dest = match self.registers.get(&destinations[0].to_string()) {
                        Some(ptr) => ptr,
                        None => {
                            // allocate a new register
                            let ptr = self
                                .builder
                                .build_alloca(lhs_value.get_type(), &destinations[0].to_string());
                            self.registers.insert(destinations[0].to_string(), ptr);
                            self.registers.get(&destinations[0].to_string()).unwrap()
                        }
                    };
                    self.builder.build_store(*dest, result);
                } else if op.eq("mul") {
                    // load lhs and rhs values
                    let lhs_value = operands_denote[0];
                    let rhs_value = operands_denote[1];

                    // add lhs and rhs values
                    let result = self.build_int_mul(
                        lhs_value.into_int_value(),
                        rhs_value.into_int_value(),
                        "mul",
                    );

                    // store result in destination
                    let dest = match self.registers.get(&destinations[0].to_string()) {
                        Some(ptr) => ptr,
                        None => {
                            // allocate a new register
                            let ptr = self
                                .builder
                                .build_alloca(lhs_value.get_type(), &destinations[0].to_string());
                            self.registers.insert(destinations[0].to_string(), ptr);
                            self.registers.get(&destinations[0].to_string()).unwrap()
                        }
                    };
                    self.builder.build_store(*dest, result);
                } else if op.eq("div") {
                    // load lhs and rhs values
                    let lhs_value = operands_denote[0];
                    let rhs_value = operands_denote[1];

                    // add lhs and rhs values
                    let result = self.build_int_div(
                        lhs_value.into_int_value(),
                        rhs_value.into_int_value(),
                        "div",
                    );

                    // store result in destination
                    let dest = match self.registers.get(&destinations[0].to_string()) {
                        Some(ptr) => ptr,
                        None => {
                            // allocate a new register
                            let ptr = self
                                .builder
                                .build_alloca(lhs_value.get_type(), &destinations[0].to_string());
                            self.registers.insert(destinations[0].to_string(), ptr);
                            self.registers.get(&destinations[0].to_string()).unwrap()
                        }
                    };
                    self.builder.build_store(*dest, result);
                } else if op.eq("mod") {
                    // load lhs and rhs values
                    let lhs_value = operands_denote[0];
                    let rhs_value = operands_denote[1];

                    // add lhs and rhs values
                    let result = self.build_int_rem(
                        lhs_value.into_int_value(),
                        rhs_value.into_int_value(),
                        "mod",
                    );

                    // store result in destination
                    let dest = match self.registers.get(&destinations[0].to_string()) {
                        Some(ptr) => ptr,
                        None => {
                            // allocate a new register
                            let ptr = self
                                .builder
                                .build_alloca(lhs_value.get_type(), &destinations[0].to_string());
                            self.registers.insert(destinations[0].to_string(), ptr);
                            self.registers.get(&destinations[0].to_string()).unwrap()
                        }
                    };
                    self.builder.build_store(*dest, result);
                } else if op.eq("and") {
                    // load lhs and rhs values
                    let lhs_value = operands_denote[0];
                    let rhs_value = operands_denote[1];

                    // add lhs and rhs values
                    let result = self.build_int_and(
                        lhs_value.into_int_value(),
                        rhs_value.into_int_value(),
                        "and",
                    );

                    // store result in destination
                    let dest = match self.registers.get(&destinations[0].to_string()) {
                        Some(ptr) => ptr,
                        None => {
                            // allocate a new register
                            let ptr = self
                                .builder
                                .build_alloca(lhs_value.get_type(), &destinations[0].to_string());
                            self.registers.insert(destinations[0].to_string(), ptr);
                            self.registers.get(&destinations[0].to_string()).unwrap()
                        }
                    };
                    self.builder.build_store(*dest, result);
                } else if op.eq("or") {
                    // load lhs and rhs values
                    let lhs_value = operands_denote[0];
                    let rhs_value = operands_denote[1];

                    // add lhs and rhs values
                    let result = self.build_int_or(
                        lhs_value.into_int_value(),
                        rhs_value.into_int_value(),
                        "or",
                    );

                    // store result in destination
                    let dest = match self.registers.get(&destinations[0].to_string()) {
                        Some(ptr) => ptr,
                        None => {
                            // allocate a new register
                            let ptr = self
                                .builder
                                .build_alloca(lhs_value.get_type(), &destinations[0].to_string());
                            self.registers.insert(destinations[0].to_string(), ptr);
                            self.registers.get(&destinations[0].to_string()).unwrap()
                        }
                    };
                    self.builder.build_store(*dest, result);
                } else if op.eq("xor") {
                    // load lhs and rhs values
                    let lhs_value = operands_denote[0];
                    let rhs_value = operands_denote[1];

                    // add lhs and rhs values
                    let result = self.build_int_xor(
                        lhs_value.into_int_value(),
                        rhs_value.into_int_value(),
                        "xor",
                    );

                    // store result in destination
                    let dest = match self.registers.get(&destinations[0].to_string()) {
                        Some(ptr) => ptr,
                        None => {
                            // allocate a new register
                            let ptr = self
                                .builder
                                .build_alloca(lhs_value.get_type(), &destinations[0].to_string());
                            self.registers.insert(destinations[0].to_string(), ptr);
                            self.registers.get(&destinations[0].to_string()).unwrap()
                        }
                    };
                    self.builder.build_store(*dest, result);
                } else if op.eq("shl") {
                    // load lhs and rhs values
                    let lhs_value = operands_denote[0];
                    let rhs_value = operands_denote[1];

                    // add lhs and rhs values
                    let result = self.build_int_shl(
                        lhs_value.into_int_value(),
                        rhs_value.into_int_value(),
                        "shl",
                    );

                    // store result in destination
                    let dest = match self.registers.get(&destinations[0].to_string()) {
                        Some(ptr) => ptr,
                        None => {
                            // allocate a new register
                            let ptr = self
                                .builder
                                .build_alloca(lhs_value.get_type(), &destinations[0].to_string());
                            self.registers.insert(destinations[0].to_string(), ptr);
                            self.registers.get(&destinations[0].to_string()).unwrap()
                        }
                    };
                    self.builder.build_store(*dest, result);
                } else if op.eq("shr") {
                    // load lhs and rhs values
                    let lhs_value = operands_denote[0];
                    let rhs_value = operands_denote[1];

                    // add lhs and rhs values
                    let result = self.build_int_shr(
                        lhs_value.into_int_value(),
                        rhs_value.into_int_value(),
                        "shr",
                    );

                    // store result in destination
                    let dest = match self.registers.get(&destinations[0].to_string()) {
                        Some(ptr) => ptr,
                        None => {
                            // allocate a new register
                            let ptr = self
                                .builder
                                .build_alloca(lhs_value.get_type(), &destinations[0].to_string());
                            self.registers.insert(destinations[0].to_string(), ptr);
                            self.registers.get(&destinations[0].to_string()).unwrap()
                        }
                    };
                    self.builder.build_store(*dest, result);
                } else if op.eq("lt") {
                    // load lhs and rhs values
                    let lhs_value = operands_denote[0];
                    let rhs_value = operands_denote[1];

                    // add lhs and rhs values
                    let result = self.build_int_lt(
                        lhs_value.into_int_value(),
                        rhs_value.into_int_value(),
                        "lt",
                    );

                    // store result in destination
                    let dest = match self.registers.get(&destinations[0].to_string()) {
                        Some(ptr) => ptr,
                        None => {
                            // allocate a new register
                            let ptr = self
                                .builder
                                .build_alloca(lhs_value.get_type(), &destinations[0].to_string());
                            self.registers.insert(destinations[0].to_string(), ptr);
                            self.registers.get(&destinations[0].to_string()).unwrap()
                        }
                    };
                    // cast result to destination type
                    let result = self.builder.build_int_z_extend(
                        result,
                        lhs_value.get_type().into_int_type(),
                        "zext",
                    );
                    self.builder.build_store(*dest, result);
                } else if op.eq("gt") {
                    // load lhs and rhs values
                    let lhs_value = operands_denote[0];
                    let rhs_value = operands_denote[1];

                    // add lhs and rhs values
                    let result = self.build_int_gt(
                        lhs_value.into_int_value(),
                        rhs_value.into_int_value(),
                        "gt",
                    );

                    // store result in destination
                    let dest = match self.registers.get(&destinations[0].to_string()) {
                        Some(ptr) => ptr,
                        None => {
                            // allocate a new register
                            let ptr = self
                                .builder
                                .build_alloca(lhs_value.get_type(), &destinations[0].to_string());
                            self.registers.insert(destinations[0].to_string(), ptr);
                            self.registers.get(&destinations[0].to_string()).unwrap()
                        }
                    };
                    // cast result to destination type
                    let result = self.builder.build_int_z_extend(
                        result,
                        lhs_value.get_type().into_int_type(),
                        "zext",
                    );
                    self.builder.build_store(*dest, result);
                } else if op.eq("le") {
                    // load lhs and rhs values
                    let lhs_value = operands_denote[0];
                    let rhs_value = operands_denote[1];

                    // add lhs and rhs values
                    let result = self.build_int_le(
                        lhs_value.into_int_value(),
                        rhs_value.into_int_value(),
                        "le",
                    );

                    // store result in destination
                    let dest = match self.registers.get(&destinations[0].to_string()) {
                        Some(ptr) => ptr,
                        None => {
                            // allocate a new register
                            let ptr = self
                                .builder
                                .build_alloca(lhs_value.get_type(), &destinations[0].to_string());
                            self.registers.insert(destinations[0].to_string(), ptr);
                            self.registers.get(&destinations[0].to_string()).unwrap()
                        }
                    };
                    // cast result to destination type
                    let result = self.builder.build_int_z_extend(
                        result,
                        lhs_value.get_type().into_int_type(),
                        "zext",
                    );
                    self.builder.build_store(*dest, result);
                } else if op.eq("gte") {
                    // load lhs and rhs values
                    let lhs_value = operands_denote[0];
                    let rhs_value = operands_denote[1];

                    // add lhs and rhs values
                    let result = self.build_int_ge(
                        lhs_value.into_int_value(),
                        rhs_value.into_int_value(),
                        "gte",
                    );

                    // store result in destination
                    let dest = match self.registers.get(&destinations[0].to_string()) {
                        Some(ptr) => ptr,
                        None => {
                            // allocate a new register
                            let ptr = self
                                .builder
                                .build_alloca(lhs_value.get_type(), &destinations[0].to_string());
                            self.registers.insert(destinations[0].to_string(), ptr);
                            self.registers.get(&destinations[0].to_string()).unwrap()
                        }
                    };
                    // cast result to destination type
                    let result = self.builder.build_int_z_extend(
                        result,
                        lhs_value.get_type().into_int_type(),
                        "zext",
                    );
                    self.builder.build_store(*dest, result);
                } else if op.eq("ternary") {
                    // load lhs and rhs values
                    let condition = operands_denote[0];
                    let lhs_value = operands_denote[1];
                    let rhs_value = operands_denote[2];

                    // add lhs and rhs values
                    let result = self.build_ternary(
                        condition.into_int_value(),
                        lhs_value.into_int_value(),
                        rhs_value.into_int_value(),
                        "ternary",
                    );

                    // store result in destination
                    let dest = match self.registers.get(&destinations[0].to_string()) {
                        Some(ptr) => ptr,
                        None => {
                            // allocate a new register
                            let ptr = self
                                .builder
                                .build_alloca(lhs_value.get_type(), &destinations[0].to_string());
                            self.registers.insert(destinations[0].to_string(), ptr);
                            self.registers.get(&destinations[0].to_string()).unwrap()
                        }
                    };
                    self.builder.build_store(*dest, result);
                } else {
                    panic!("Unsupported literal operation")
                }
            }
            Assert(op) => {
                let lhs_value = operands_denote[0];
                let rhs_value = operands_denote[1];
                let lhs_type = lhs_value.get_type();
                let rhs_type = rhs_value.get_type();
                let assert_function_name = format!(
                    "aleo.{}.{}.{}",
                    op,
                    lhs_type.to_string().trim_matches('\"'),
                    rhs_type.to_string().trim_matches('\"')
                );

                // find the assert function
                let assert_function = self.module.get_function(&assert_function_name);
                // if the assert function is not found, create a new one
                let assert_function = match assert_function {
                    Some(assert_function) => assert_function,
                    None => {
                        // create the assert function
                        let assert_function = self.module.add_function(
                            &assert_function_name,
                            self.context
                                .void_type()
                                .fn_type(&[lhs_type.into(), rhs_type.into()], false),
                            None,
                        );
                        // return the assert function
                        assert_function
                    }
                };
                // call assert_function with the given arguments
                self.builder
                    .build_call(assert_function, &[lhs_value.into(), rhs_value.into()], op);
            }
            Call => {
                // call calculate_interest r1 r2 r3 into r5;
                let callee = operator.unwrap();
                let function_name = callee.to_string();
                let function = self
                    .module
                    .get_function(&function_name)
                    .expect(&format!("Function {} not found", function_name));
                let mut arguments: Vec<BasicMetadataValueEnum> = Vec::new();
                for operand in operands_denote.iter() {
                    arguments.push(BasicMetadataValueEnum::from(*operand));
                }
                let result = self.builder.build_call(
                    function,
                    &arguments.as_slice(),
                    &destinations[0].to_string(),
                );
                let dest = match self.registers.get(&destinations[0].to_string()) {
                    Some(ptr) => ptr,
                    None => {
                        // allocate a new register
                        let ptr = self.builder.build_alloca(
                            result.try_as_basic_value().left().unwrap().get_type(),
                            &destinations[0].to_string(),
                        );
                        self.registers.insert(destinations[0].to_string(), ptr);
                        self.registers.get(&destinations[0].to_string()).unwrap()
                    }
                };
                self.builder
                    .build_store(*dest, result.try_as_basic_value().left().unwrap());
            }
            Cast => {
                // cast a b c into d as e
                let register_type = register_type.unwrap();
                let struct_name = match register_type {
                    RegisterType::Plaintext(PlaintextType::Struct(struct_name)) => struct_name,
                    RegisterType::Record(struct_name) => struct_name,
                    _ => panic!("Unsupported cast"),
                };
                let struct_type = self
                    .module
                    .get_struct_type(&struct_name.to_string())
                    .expect(&format!("Struct type {} not found", struct_name));
                // create a struct of the given type with the given values
                //  and store it in the destination
                let register = self.builder.build_alloca(struct_type, "struct");
                for (i, operand) in operands_denote.iter().enumerate() {
                    let dest = self
                        .builder
                        .build_struct_gep(register, i as u32, "struct_gep")
                        .unwrap();
                    if operand.is_int_value() {
                        self.builder.build_store(dest, operand.into_int_value());
                    } else if operand.is_float_value() {
                        self.builder.build_store(dest, operand.into_float_value());
                    } else if operand.is_struct_value() {
                        self.builder.build_store(dest, operand.into_struct_value());
                    } else if operand.is_array_value() {
                        self.builder.build_store(dest, operand.into_pointer_value());
                    } else {
                        panic!("Unsupported cast")
                    }
                }
                // store the register in the destination
                let dest = match self.registers.get(&destinations[0].to_string()) {
                    Some(ptr) => ptr,
                    None => {
                        // allocate a new register
                        let ptr = self
                            .builder
                            .build_alloca(struct_type, &destinations[0].to_string());
                        self.registers.insert(destinations[0].to_string(), ptr);
                        self.registers.get(&destinations[0].to_string()).unwrap()
                    }
                };
                // load register
                let register = self.builder.build_load(register, "struct");
                self.builder.build_store(*dest, register);
            }
            Command(_) =>
            // this should not happen
            {
                panic!("Unexpected command")
            }
            Commit(op) => {
                let lhs_value = operands_denote[0];
                let rhs_value = operands_denote[1];
                let lhs_type = lhs_value.get_type();
                let rhs_type = rhs_value.get_type();
                let commit_function_name = format!(
                    "aleo.{}.{}.{}",
                    op,
                    lhs_type.to_string().trim_matches('\"'),
                    rhs_type.to_string().trim_matches('\"')
                );

                // find the commit function
                let commit_function = self.module.get_function(&commit_function_name);
                // if the commit function is not found, create a new one
                let commit_function = match commit_function {
                    Some(commit_function) => commit_function,
                    None => {
                        // create the commit function
                        let commit_function = self.module.add_function(
                            &commit_function_name,
                            // TODO: field type
                            self.context
                                .i128_type()
                                .fn_type(&[lhs_type.into(), rhs_type.into()], false),
                            None,
                        );
                        // return the commit function
                        commit_function
                    }
                };
                // call commit_function with the given arguments
                let result = self.builder.build_call(
                    commit_function,
                    &[lhs_value.into(), rhs_value.into()],
                    op,
                );

                // store the result in the destination
                let dest = match self.registers.get(&destinations[0].to_string()) {
                    Some(ptr) => ptr,
                    None => {
                        // allocate a new register
                        let ptr = self
                            .builder
                            .build_alloca(lhs_value.get_type(), &destinations[0].to_string());
                        self.registers.insert(destinations[0].to_string(), ptr);
                        self.registers.get(&destinations[0].to_string()).unwrap()
                    }
                };
                self.builder
                    .build_store(*dest, result.try_as_basic_value().left().unwrap());
            }
            Finalize(_) => {
                // call the finalize function with the given arguments
                let finalize_function = self
                    .module
                    .get_function(&function_name)
                    .expect("finalize function not found");
                let finalize_function_args_values: Vec<BasicMetadataValueEnum> = operands_denote
                    .iter()
                    .map(|v| BasicMetadataValueEnum::from(*v))
                    .collect();

                // call the finalize function
                self.builder.build_call(
                    finalize_function,
                    finalize_function_args_values.as_slice(),
                    "",
                );
            }
            Hash(op) => {
                let lhs_value = operands_denote[0];
                let lhs_type = lhs_value.get_type();
                let hash_function_name =
                    format!("aleo.{}.{}", op, lhs_type.to_string().trim_matches('\"'));

                // find the hash function
                let hash_function = self.module.get_function(&hash_function_name);
                // if the hash function is not found, create a new one
                let hash_function = match hash_function {
                    Some(hash_function) => hash_function,
                    None => {
                        // create the hash function
                        let hash_function = self.module.add_function(
                            &hash_function_name,
                            // TODO: return field type
                            self.context.i128_type().fn_type(&[lhs_type.into()], false),
                            None,
                        );
                        // return the assert function
                        hash_function
                    }
                };
                // call assert_function with the given arguments and store the result in the destination
                let result = self
                    .builder
                    .build_call(hash_function, &[lhs_value.into()], op);
                let dest = match self.registers.get(&destinations[0].to_string()) {
                    Some(ptr) => ptr,
                    None => {
                        // allocate a new register
                        let ptr = self
                            .builder
                            .build_alloca(lhs_value.get_type(), &destinations[0].to_string());
                        self.registers.insert(destinations[0].to_string(), ptr);
                        self.registers.get(&destinations[0].to_string()).unwrap()
                    }
                };
                self.builder
                    .build_store(*dest, result.try_as_basic_value().left().unwrap());
            }
            Is(op) => {
                // is.eq and is.neq
                let lhs_value = operands_denote[0];
                let rhs_value = operands_denote[1];

                // use llvm.icmp.eq and llvm.icmp.neq
                if op == "is.eq" {
                    let result = self.builder.build_int_compare(
                        IntPredicate::EQ,
                        lhs_value.into_int_value(),
                        rhs_value.into_int_value(),
                        "is.eq",
                    );
                    // store result in destination
                    let dest = match self.registers.get(&destinations[0].to_string()) {
                        Some(ptr) => ptr,
                        None => {
                            // allocate a new register
                            let ptr = self
                                .builder
                                .build_alloca(lhs_value.get_type(), &destinations[0].to_string());
                            self.registers.insert(destinations[0].to_string(), ptr);
                            self.registers.get(&destinations[0].to_string()).unwrap()
                        }
                    };
                    self.builder.build_store(*dest, result);
                } else if op == "is.neq" {
                    let result = self.builder.build_int_compare(
                        IntPredicate::NE,
                        lhs_value.into_int_value(),
                        rhs_value.into_int_value(),
                        "is.neq",
                    );
                    // store result in destination
                    let dest = match self.registers.get(&destinations[0].to_string()) {
                        Some(ptr) => ptr,
                        None => {
                            // allocate a new register
                            let ptr = self
                                .builder
                                .build_alloca(lhs_value.get_type(), &destinations[0].to_string());
                            self.registers.insert(destinations[0].to_string(), ptr);
                            self.registers.get(&destinations[0].to_string()).unwrap()
                        }
                    };
                    self.builder.build_store(*dest, result);
                } else {
                    panic!("Unsupported Is operation")
                }
            }
        }
    }

    pub fn denote_command(&mut self, function: FunctionValue<'ctx>, command: &Command<Testnet3>) {
        match command {
            Command::Instruction(i) => self.denote_instruction(
                "".to_string(),
                i.opcode(),
                i.operands(),
                i.destinations().as_slice(),
                // if i is Cast, the get register type
                match i {
                    Instruction::Cast(c) => Some(*c.register_type()),
                    _ => None,
                },
                match i {
                    Instruction::Call(c) => Some(c.operator()),
                    _ => None,
                },
            ),
            Command::Get(get) => {
                let mapping = get.mapping_name().to_string();
                let key = get.key();
                let destination = get.destination();

                let mapping_ptr = self.mappings.get(&mapping).unwrap();
                let mapping_element_type =
                    BasicTypeEnum::try_from(mapping_ptr.get_type().get_element_type())
                        .unwrap()
                        .into_array_type()
                        .get_element_type();

                let key_value: BasicValueEnum = denote_operand!(
                    key,
                    self.registers,
                    self.builder,
                    self.context,
                    self.program
                );

                let dest = match self.registers.get(&destination.to_string()) {
                    Some(ptr) => ptr,
                    None => {
                        // allocate a new register
                        let ptr = self
                            .builder
                            .build_alloca(mapping_element_type, &destination.to_string());
                        self.registers.insert(destination.to_string(), ptr);
                        self.registers.get(&destination.to_string()).unwrap()
                    }
                };

                unsafe {
                    let gep = self.builder.build_gep(
                        *mapping_ptr,
                        &[
                            self.context.i32_type().const_zero(),
                            key_value.into_int_value(),
                        ],
                        "array_gep",
                    );

                    // store result in destination
                    let result = self.builder.build_load(gep, "load");
                    self.builder.build_store(*dest, result);
                }
            }
            Command::GetOrInit(get) => {
                let default = get.default();
                let mapping = get.mapping_name().to_string();
                let key = get.key();
                let destination = get.destination();

                let mapping_ptr = self.mappings.get(&mapping).unwrap();
                let mapping_element_type =
                    BasicTypeEnum::try_from(mapping_ptr.get_type().get_element_type())
                        .unwrap()
                        .into_array_type()
                        .get_element_type();

                let key_value: BasicValueEnum = denote_operand!(
                    key,
                    self.registers,
                    self.builder,
                    self.context,
                    self.program
                );

                let dest = match self.registers.get(&destination.to_string()) {
                    Some(ptr) => ptr,
                    None => {
                        // allocate a new register
                        let ptr = self
                            .builder
                            .build_alloca(mapping_element_type, &destination.to_string());
                        self.registers.insert(destination.to_string(), ptr);
                        self.registers.get(&destination.to_string()).unwrap()
                    }
                };

                unsafe {
                    // if the key is not present, initialize it with the default value
                    let gep = self.builder.build_gep(
                        *mapping_ptr,
                        &[
                            self.context.i32_type().const_zero(),
                            key_value.into_int_value(),
                        ],
                        "array_gep",
                    );

                    let result = self.builder.build_load(gep, "load");
                    let result_type = result.get_type();
                    let is_null = self.builder.build_int_compare(
                        IntPredicate::EQ,
                        result.into_int_value(),
                        result_type.const_zero().into_int_value(),
                        "is_null",
                    );

                    let then_block = self.context.append_basic_block(function, "then");
                    let else_block = self.context.append_basic_block(function, "else");
                    let merge_block = self.context.append_basic_block(function, "merge");

                    self.builder
                        .build_conditional_branch(is_null, then_block, else_block);

                    // then block
                    self.builder.position_at_end(then_block);
                    let default_value: BasicValueEnum = denote_operand!(
                        default,
                        self.registers,
                        self.builder,
                        self.context,
                        self.program
                    );
                    self.builder.build_store(gep, default_value);
                    self.builder.build_store(*dest, default_value);
                    self.builder.build_unconditional_branch(merge_block);

                    // else block
                    self.builder.position_at_end(else_block);
                    self.builder.build_store(*dest, result);
                    self.builder.build_unconditional_branch(merge_block);

                    // merge block
                    self.builder.position_at_end(merge_block);
                }
            }
            Command::Set(set) => {
                let mapping = set.mapping_name().to_string();
                let key = set.key();
                let value = set.value();

                let mapping_ptr = self.mappings.get(&mapping).unwrap();

                let key_value: BasicValueEnum = denote_operand!(
                    key,
                    self.registers,
                    self.builder,
                    self.context,
                    self.program
                );

                let value_value: BasicValueEnum = denote_operand!(
                    value,
                    self.registers,
                    self.builder,
                    self.context,
                    self.program
                );

                unsafe {
                    let gep = self.builder.build_gep(
                        *mapping_ptr,
                        &[
                            self.context.i32_type().const_zero(),
                            key_value.into_int_value(),
                        ],
                        "array_gep",
                    );

                    self.builder.build_store(gep, value_value);
                }
            }
        }
    }

    pub fn denote_function(&mut self, function: &Function<Testnet3>) {
        // clear registers
        self.registers.clear();
        let function_name = function.name();
        let function_args = function.inputs();
        // TODO: there might be multiple return values, need to create a struct for that
        let function_return = function.outputs();

        let function_body = function.instructions();

        let finalizer = function.finalize();

        match finalizer {
            Some(f) => {
                // create finalize function, which is a function with no return value
                self.denote_finalize_function(&f.1);
            }
            None => {}
        }
        self.registers.clear();

        // need to allocate memory for arguments and they are passed by value as parameters
        let mut param_types = function_args
            .iter()
            .map(|arg| self.denote_type(arg.value_type()))
            .collect::<Vec<_>>();
        // 0 is the first parameter, which is the self.caller
        param_types.insert(0, (self.context.i128_type().as_basic_type_enum().into(), 1));

        let param_names = function_args
            .iter()
            .map(|arg| arg.register().to_string())
            .collect::<Vec<_>>();

        // summarize parameters
        let mut params_summary: Vec<(String, String, u32)> = Vec::new();
        for (i, param) in param_types.iter().enumerate() {
            let param_name = if i == 0 {
                "self.caller".to_string()
            } else {
                param_names[i - 1].clone()
            };
            let param_type = param.0;
            let param_visibility = param.1;
            params_summary.push((param_name, param_type.to_string(), param_visibility));
        }

        // TODO: only handle single return value for now
        assert!(function_return.len() == 1);
        let return_type_all = self.denote_type(function_return[0].value_type());

        let return_type: BasicTypeEnum = return_type_all.0.try_into().unwrap();

        let fn_type = return_type.fn_type(
            param_types
                .iter()
                .map(|p| p.0)
                .collect::<Vec<_>>()
                .as_slice(),
            false,
        );

        // create function
        let function = self
            .module
            .add_function(&function_name.to_string(), fn_type, None);

        // add names to parameters
        for (i, param) in function.get_param_iter().enumerate() {
            if i == 0 {
                param.set_name("self.caller");
            } else {
                param.set_name(&param_names[i - 1]);
            }
        }

        let entry = self.context.append_basic_block(function, "entry");
        let body = self.context.append_basic_block(function, "body");
        let exit = self.context.append_basic_block(function, "exit");

        // (1) build entry block
        self.builder.position_at_end(entry);
        // some instructions to initialize the function
        // allocate memory for local variables
        for (i, arg) in function.get_param_iter().enumerate() {
            let name = if i == 0 {
                "self.caller"
            } else {
                &param_names[i - 1]
            };
            let ptr = self.builder.build_alloca(arg.get_type(), name);
            self.builder.build_store(ptr, arg);
            let reg_name = if i == 0 {
                "self.caller".to_string()
            } else {
                function_args[i - 1].register().to_string()
            };
            self.registers.insert(reg_name, ptr);
        }
        // // allocate self.caller
        // let caller_ptr = self
        //     .builder
        //     .build_alloca(self.context.i128_type(), "self.caller");
        // // initialize with 0
        // self.builder
        //     .build_store(caller_ptr, self.context.i128_type().const_zero());
        // self.registers.insert("self.caller".to_string(), caller_ptr);

        self.builder.build_unconditional_branch(body);

        // (2) build body block
        self.builder.position_at_end(body);

        // add instructions to body block
        for instruction in function_body {
            self.denote_instruction(
                "".to_string(),
                instruction.opcode(),
                instruction.operands(),
                instruction.destinations().as_slice(),
                match instruction {
                    Instruction::Cast(c) => Some(*c.register_type()),
                    _ => None,
                },
                match instruction {
                    Instruction::Call(c) => Some(c.operator()),
                    _ => None,
                },
            );
        }

        self.builder.build_unconditional_branch(exit);

        // (3) build exit block
        self.builder.position_at_end(exit);
        // finalize instructions and finalize function
        match finalizer {
            Some(finalizer) => {
                let finalize_op = &finalizer.0;
                let finalize_func = &finalizer.1;
                // build finalize op in exit block

                self.denote_instruction(
                    finalize_func.name().to_string() + ".finalize",
                    Opcode::Finalize("finalize"),
                    finalize_op.operands(),
                    finalize_op.destinations().as_slice(),
                    None,
                    None,
                );
            }
            None => {}
        }

        // return value
        // output must be predefined
        let mut output_summary: Vec<(String, String, u32)> = Vec::new();
        match &function_return[0].operand() {
            Operand::Register(Register::Locator(_)) => {
                let return_ptr = self
                    .registers
                    .get(&function_return[0].operand().to_string())
                    .unwrap();
                let return_value = self.builder.build_load(*return_ptr, "load");
                self.builder.build_return(Some(&return_value));
                output_summary.push((
                    function_return[0].operand().to_string(),
                    return_type_all.0.to_string(),
                    return_type_all.1,
                ));
            }
            Operand::Register(Register::Member(id, member)) => {
                let name = format!("r{}", id.to_string());
                let mut ptr = *self.registers.get(&name).unwrap();
                // handle nested member
                for m in member {
                    let struct_name = ptr.get_type().get_element_type().into_struct_type();
                    let struct_name = struct_name.get_name().unwrap().to_str().unwrap();
                    let prog_struct_type = self
                        .program
                        .get_record(&Identifier::try_from(struct_name).unwrap())
                        .unwrap();
                    // note that the first field is the owner address
                    let members = prog_struct_type.entries();
                    let index = if m.to_string().eq("owner") {
                        0
                    } else {
                        members
                            .iter()
                            .find_position(|(e, _)| e.to_string().eq(m.to_string().as_str()))
                            .unwrap()
                            .0
                            + 1
                    };

                    let ptr_build: PointerValue = self
                        .builder
                        .build_struct_gep(ptr, index as u32, "gep")
                        .unwrap();
                    ptr = ptr_build;
                }
                let ptr_value = self.builder.build_load(ptr, "load");
                self.builder.build_return(Some(&ptr_value));
                output_summary.push((
                    function_return[0].operand().to_string(),
                    return_type_all.0.to_string(),
                    return_type_all.1,
                ));
            }
            _ => {
                panic!("TODO: implement return value")
            }
        };

        let variables_summary = self
            .registers
            .iter()
            .map(|(k, v)| {
                let name = k.to_string();
                let ty = v.get_type().to_string();
                // unknown visibility
                (name, ty, 0)
            })
            .collect::<Vec<(String, String, u32)>>();

        self.summary.push((
            function_name.to_string(),
            params_summary,
            output_summary,
            variables_summary,
        ));
    }

    // denote a closure should be as same as a function
    pub fn denote_closure(&mut self, closure: &Closure<Testnet3>) {
        // clear registers
        self.registers.clear();
        let function_name = closure.name();
        let function_args = closure.inputs();
        // TODO: there might be multiple return values, need to create a struct for that
        let function_return = closure.outputs();

        let function_body = closure.instructions();

        // need to allocate memory for arguments and they are passed by value as parameters
        let param_types = function_args
            .iter()
            .map(|arg| match arg.register_type() {
                RegisterType::Plaintext(t) => self.denote_type(&Constant(*t)),
                RegisterType::Record(t) => self.denote_type(&Record(*t)),
                RegisterType::ExternalRecord(t) => self.denote_type(&ExternalRecord(*t)),
            })
            .collect::<Vec<_>>();

        let param_names = function_args
            .iter()
            .map(|arg| arg.register().to_string())
            .collect::<Vec<_>>();

        // summarize parameters
        let mut params_summary: Vec<(String, String, u32)> = Vec::new();
        for (i, param) in param_types.iter().enumerate() {
            let param_name = param_names[i].clone();
            let param_type = param.0;
            let param_visibility = param.1;
            params_summary.push((param_name, param_type.to_string(), param_visibility));
        }

        // TODO: only handle single return value for now
        assert!(function_return.len() == 1);
        let function_return_type = function_return
            .iter()
            .map(|arg| match arg.register_type() {
                RegisterType::Plaintext(t) => self.denote_type(&Constant(*t)),
                RegisterType::Record(t) => self.denote_type(&Record(*t)),
                RegisterType::ExternalRecord(t) => self.denote_type(&ExternalRecord(*t)),
            })
            .collect::<Vec<_>>();
        let return_type_all = function_return_type[0];

        let return_type: BasicTypeEnum = return_type_all.0.try_into().unwrap();

        let fn_type = return_type.fn_type(
            param_types
                .iter()
                .map(|p| p.0)
                .collect::<Vec<_>>()
                .as_slice(),
            false,
        );

        // create function
        let function = self
            .module
            .add_function(&function_name.to_string(), fn_type, None);

        // add names to parameters
        for (i, param) in function.get_param_iter().enumerate() {
            param.set_name(&param_names[i]);
        }

        let entry = self.context.append_basic_block(function, "entry");
        let body = self.context.append_basic_block(function, "body");
        let exit = self.context.append_basic_block(function, "exit");

        // (1) build entry block
        self.builder.position_at_end(entry);
        // some instructions to initialize the function
        // allocate memory for local variables
        for (i, arg) in function.get_param_iter().enumerate() {
            let ptr = self.builder.build_alloca(arg.get_type(), &param_names[i]);
            self.builder.build_store(ptr, arg);
            self.registers
                .insert(function_args[i].register().to_string(), ptr);
        }
        self.builder.build_unconditional_branch(body);

        // (2) build body block
        self.builder.position_at_end(body);

        // add instructions to body block
        for instruction in function_body {
            self.denote_instruction(
                "".to_string(),
                instruction.opcode(),
                instruction.operands(),
                instruction.destinations().as_slice(),
                match instruction {
                    Instruction::Cast(c) => Some(*c.register_type()),
                    _ => None,
                },
                match instruction {
                    Instruction::Call(c) => Some(c.operator()),
                    _ => None,
                },
            );
        }

        self.builder.build_unconditional_branch(exit);

        // (3) build exit block
        self.builder.position_at_end(exit);

        // return value
        // output must be predefined
        let mut output_summary: Vec<(String, String, u32)> = Vec::new();
        match &function_return[0].operand() {
            Operand::Register(Register::Locator(_)) => {
                let return_ptr = self
                    .registers
                    .get(&function_return[0].operand().to_string())
                    .unwrap();
                let return_value = self.builder.build_load(*return_ptr, "load");
                self.builder.build_return(Some(&return_value));
                output_summary.push((
                    function_return[0].operand().to_string(),
                    return_type_all.0.to_string(),
                    return_type_all.1,
                ));
            }
            Operand::Register(Register::Member(id, member)) => {
                let name = format!("r{}", id.to_string());
                let mut ptr = *self.registers.get(&name).unwrap();
                // handle nested member
                for m in member {
                    let struct_name = ptr.get_type().get_element_type().into_struct_type();
                    let struct_name = struct_name.get_name().unwrap().to_str().unwrap();
                    let prog_struct_type = self
                        .program
                        .get_record(&Identifier::try_from(struct_name).unwrap())
                        .unwrap();
                    // note that the first field is the owner address
                    let members = prog_struct_type.entries();
                    let index = if m.to_string().eq("owner") {
                        0
                    } else {
                        members
                            .iter()
                            .find_position(|(e, _)| e.to_string().eq(m.to_string().as_str()))
                            .unwrap()
                            .0
                            + 1
                    };

                    let ptr_build: PointerValue = self
                        .builder
                        .build_struct_gep(ptr, index as u32, "gep")
                        .unwrap();
                    ptr = ptr_build;
                }
                // load the value
                let ptr_value = self.builder.build_load(ptr, "load");
                self.builder.build_return(Some(&ptr_value));
                output_summary.push((
                    function_return[0].operand().to_string(),
                    return_type_all.0.to_string(),
                    return_type_all.1,
                ));
            }
            _ => {
                panic!("TODO: implement return value")
            }
        };

        let variables_summary = self
            .registers
            .iter()
            .map(|(k, v)| {
                let name = k.to_string();
                let ty = v.get_type().to_string();
                // unknown visibility
                (name, ty, 0)
            })
            .collect::<Vec<(String, String, u32)>>();

        self.summary.push((
            function_name.to_string(),
            params_summary,
            output_summary,
            variables_summary,
        ));
    }

    pub fn denote_finalize_function(&mut self, function: &Finalize<Testnet3>) {
        self.registers.clear();
        let function_name = function.name().to_string() + ".finalize";
        let function_args = function.inputs();
        let function_body = function.commands();

        // need to allocate memory for arguments and they are passed by value as parameters
        let param_types = function_args
            .iter()
            .map(|arg| self.denote_basic_type(arg.plaintext_type()))
            .collect::<Vec<_>>();

        let param_names = function_args
            .iter()
            .map(|arg| arg.register().to_string())
            .collect::<Vec<_>>();

        let mut params_summary: Vec<(String, String, u32)> = Vec::new();
        for (i, param) in param_types.iter().enumerate() {
            let param_name = param_names[i].clone();
            let param_type = param;
            let param_visibility = 0;
            params_summary.push((param_name, param_type.to_string(), param_visibility));
        }

        let fn_type = self
            .context
            .void_type()
            .fn_type(param_types.as_slice(), false);

        // create function
        let function = self
            .module
            .add_function(&function_name.to_string(), fn_type, None);

        // add names to parameters
        for (i, param) in function.get_param_iter().enumerate() {
            param.set_name(&param_names[i]);
        }

        let entry = self.context.append_basic_block(function, "entry");
        let body = self.context.append_basic_block(function, "body");

        // (1) build entry block
        self.builder.position_at_end(entry);
        // some instructions to initialize the function
        // allocate memory for local variables
        for (i, arg) in function.get_param_iter().enumerate() {
            let ptr = self.builder.build_alloca(arg.get_type(), &param_names[i]);
            self.builder.build_store(ptr, arg);
            self.registers
                .insert(function_args[i].register().to_string(), ptr);
        }
        self.builder.build_unconditional_branch(body);

        // (2) build body block
        self.builder.position_at_end(body);

        // add instructions to body block
        for instruction in function_body {
            self.denote_command(function, instruction);
        }

        // (3) build return
        self.builder.build_return(None);

        let variables_summary = self
            .registers
            .iter()
            .map(|(k, v)| {
                let name = k.to_string();
                let ty = v.get_type().to_string();
                // unknown visibility
                (name, ty, 0)
            })
            .collect::<Vec<(String, String, u32)>>();

        self.summary.push((
            function_name.to_string(),
            params_summary,
            Vec::new(),
            variables_summary,
        ));
    }

    pub fn denote_mapping(
        &mut self,
        mapping_name: std::string::String,
        mapping: &Mapping<Testnet3>,
    ) {
        // use a llvm array to represent the mapping
        // get key type
        let key_type = self.denote_basic_type(mapping.key().plaintext_type());
        if !key_type.is_int_type() {
            panic!("TODO: mapping key must be int type")
        }

        // get value type
        let value_type = self.denote_basic_type(mapping.value().plaintext_type());

        // size is 512 by default
        let size = 512;
        let array_type = match value_type {
            BasicMetadataTypeEnum::ArrayType(t) => t.array_type(size),
            BasicMetadataTypeEnum::IntType(t) => t.array_type(size),
            BasicMetadataTypeEnum::StructType(t) => t.array_type(size),
            _ => panic!("mapping value must be array, int or struct type"),
        };

        let mapping_ptr = self.module.add_global(array_type, None, &mapping_name);
        mapping_ptr.set_initializer(&array_type.const_zero());
        mapping_ptr.set_linkage(Linkage::Internal);

        // add mapping to the mapping table
        self.mappings
            .insert(mapping_name, mapping_ptr.as_pointer_value());
    }

    pub fn codegen_program(&mut self) {
        // clear the registers and mappings cache
        self.registers.clear();
        self.mappings.clear();

        // The ID of the program.
        let program_id = self.program.id();

        // A map of the declared imports for the program.
        // TODO: Implement imports.
        let imports = self.program.imports();

        // the mappings in the program.
        let mappings = self.program.mappings();

        // closures in the program.
        // note: closures are functions without finalizers.
        let closures = self.program.closures();

        // the functions in the program.
        // note: finalizers are functions with extra mapping operations.
        let functions = self.program.functions();

        // structs and records are handled when they are used.
        // get_struct / get_record

        // build mappings
        for (mapping_name, mapping) in mappings {
            self.denote_mapping(mapping_name.to_string(), mapping);
        }

        // build closures
        for (closure_name, closure) in closures {
            self.denote_closure(closure);
        }

        // build functions
        for (function_name, function) in functions {
            self.denote_function(function);
        }
    }

    pub fn print_ir(&self, path: std::path::PathBuf) {
        match self.module.print_to_file(path) {
            Ok(_) => (),
            Err(e) => panic!("Error printing IR: {}", e),
        }
    }

    pub fn print_summary(&self, path: std::path::PathBuf) {
        // beautify the summary first
        #[derive(Serialize)]
        struct Variable {
            name: String,
            r#type: String,
            visibility: String,
        }
        #[derive(Serialize)]
        struct Summary {
            name: String,
            arguments: Vec<Variable>,
            variables: Vec<Variable>,
            returns: Vec<Variable>,
        }
        #[derive(Serialize)]
        struct ModuleSummary {
            module: String,
            functions: Vec<Summary>,
        }

        let visibility_to_string = |v| match v {
            1 => "public",
            2 => "private",
            _ => "",
        };

        let mut functions = Vec::new();
        for (name, arguments, returns, variables) in &self.summary {
            let mut args = Vec::new();
            for (name, ty, visibility) in arguments {
                args.push(Variable {
                    name: name.to_string(),
                    r#type: ty.trim_matches('\"').to_string(),
                    visibility: visibility_to_string(*visibility).to_string(),
                });
            }
            let mut vars = Vec::new();
            for (name, ty, visibility) in variables {
                vars.push(Variable {
                    name: name.to_string(),
                    r#type: ty.trim_matches('\"').to_string(),
                    visibility: visibility_to_string(*visibility).to_string(),
                });
            }
            let mut rets = Vec::new();
            for (name, ty, visibility) in returns {
                rets.push(Variable {
                    name: name.to_string(),
                    r#type: ty.trim_matches('\"').to_string(),
                    visibility: visibility_to_string(*visibility).to_string(),
                });
            }
            functions.push(Summary {
                name: name.to_string(),
                arguments: args,
                variables: vars,
                returns: rets,
            });
        }

        let module_summary = ModuleSummary {
            module: self.program.id().to_string(),
            functions,
        };

        // output in json format

        let summary = serde_json::to_string_pretty(&module_summary).unwrap();
        match std::fs::write(path, summary) {
            Ok(_) => (),
            Err(e) => panic!("Error writing summary: {}", e),
        }
    }
}

pub fn init_codegen<'ctx>(
    context: &'ctx Context,
    module: Module<'ctx>,
    program: &'ctx Program<Testnet3>,
) -> CodeGen<'ctx> {
    let builder = context.create_builder();
    let registers = HashMap::new();
    let mappings = HashMap::new();
    let summary = Vec::new();
    let codegen = CodeGen {
        context,
        module,
        builder,
        program,
        registers,
        mappings,
        summary,
    };
    return codegen;
}
