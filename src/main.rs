pub mod codegen;

use crate::codegen::init_codegen;
use inkwell::context::Context;
use snarkvm_console_network::*;
use snarkvm_synthesizer::program::*;
use std::{io::BufRead, panic};

fn parse_program(program: &str) -> Program<Testnet3> {
    match Program::parse(program) {
        Ok((remain, program)) => {
            if remain.is_empty() {
                program
            } else {
                panic!("Parser did not consume all of the string: '{remain}'");
            }
        }
        Err(e) => {
            panic!("Parser error: {}", e);
        }
    }
}

fn codegen(input_path: &std::path::Path) {
    let context = Context::create();
    // main.aleo
    let main_file_path = input_path.join("main.aleo");
    let file_name = main_file_path.file_name().unwrap().to_str().unwrap();
    let module = context.create_module(file_name);
    module.set_source_file_name(main_file_path.to_str().unwrap());

    let file = std::fs::File::open(&main_file_path).expect("Could not open file");
    let reader = std::io::BufReader::new(file);
    let program = reader
        .lines()
        .map(|line| line.unwrap())
        .collect::<Vec<_>>()
        .join("\n");

    let program = parse_program(&program);

    let result = panic::catch_unwind(|| {
        let mut codegen = init_codegen(&context, module, &program);
        codegen.codegen_program();
        let output_path: std::path::PathBuf = main_file_path.with_extension("ll");
        codegen.print_ir(output_path);
        let output_path: std::path::PathBuf = main_file_path.with_extension("json");
        codegen.print_summary(output_path);
    });

    if result.is_err() {
        let emoji = char::from_u32(0x1F37A).unwrap();
        println!(
            "{} {}: {:?}",
            emoji,
            input_path.to_string_lossy(),
            result.unwrap_err()
        );
        return;
    } else {
        let emoji = char::from_u32(0x1F389).unwrap();
        println!("{} {}", emoji, input_path.to_string_lossy());
    }
}

fn main() {
    // std::env::set_var("RUST_BACKTRACE", "1");
    let path = std::env::args().nth(1).expect("No path provided");
    let path = std::path::Path::new(&path);
    codegen(&path);
}
