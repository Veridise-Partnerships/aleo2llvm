; ModuleID = 'main.aleo'
source_filename = "./test/workshop/auction/main.aleo"

%Bid = type { i128, i64, i128, i64, i1 }

define %Bid @place_bid(i128 %self.caller, i128 %r0, i64 %r1) {
entry:
  %self.caller1 = alloca i128, align 8
  store i128 %self.caller, i128* %self.caller1, align 4
  %r02 = alloca i128, align 8
  store i128 %r0, i128* %r02, align 4
  %r13 = alloca i64, align 8
  store i64 %r1, i64* %r13, align 4
  br label %body

body:                                             ; preds = %entry
  %load = load i128, i128* %self.caller1, align 4
  %load4 = load i128, i128* %r02, align 4
  call void @aleo.assert.eq.i128.i128(i128 %load, i128 %load4)
  %load5 = load i128, i128* %r02, align 4
  %load6 = load i64, i64* %r13, align 4
  %struct = alloca %Bid, align 8
  %struct_gep = getelementptr inbounds %Bid, %Bid* %struct, i32 0, i32 0
  store i128 0, i128* %struct_gep, align 4
  %struct_gep7 = getelementptr inbounds %Bid, %Bid* %struct, i32 0, i32 1
  store i64 0, i64* %struct_gep7, align 4
  %struct_gep8 = getelementptr inbounds %Bid, %Bid* %struct, i32 0, i32 2
  store i128 %load5, i128* %struct_gep8, align 4
  %struct_gep9 = getelementptr inbounds %Bid, %Bid* %struct, i32 0, i32 3
  store i64 %load6, i64* %struct_gep9, align 4
  %struct_gep10 = getelementptr inbounds %Bid, %Bid* %struct, i32 0, i32 4
  store i1 false, i1* %struct_gep10, align 1
  %r2 = alloca %Bid, align 8
  %struct11 = load %Bid, %Bid* %struct, align 4
  store %Bid %struct11, %Bid* %r2, align 4
  br label %exit

exit:                                             ; preds = %body
  %load12 = load %Bid, %Bid* %r2, align 4
  ret %Bid %load12
}

declare void @aleo.assert.eq.i128.i128(i128, i128)

define %Bid @resolve(i128 %self.caller, %Bid %r0, %Bid %r1) {
entry:
  %self.caller1 = alloca i128, align 8
  store i128 %self.caller, i128* %self.caller1, align 4
  %r02 = alloca %Bid, align 8
  store %Bid %r0, %Bid* %r02, align 4
  %r13 = alloca %Bid, align 8
  store %Bid %r1, %Bid* %r13, align 4
  br label %body

body:                                             ; preds = %entry
  %load = load i128, i128* %self.caller1, align 4
  call void @aleo.assert.eq.i128.i128(i128 %load, i128 0)
  %load4 = load %Bid, %Bid* %r02, align 4
  %gep = getelementptr inbounds %Bid, %Bid* %r02, i32 0, i32 3
  %load5 = load i64, i64* %gep, align 4
  %load6 = load %Bid, %Bid* %r13, align 4
  %gep7 = getelementptr inbounds %Bid, %Bid* %r13, i32 0, i32 3
  %load8 = load i64, i64* %gep7, align 4
  %gte = icmp sge i64 %load5, %load8
  %r2 = alloca i64, align 8
  %zext = zext i1 %gte to i64
  store i64 %zext, i64* %r2, align 4
  %load9 = load i64, i64* %r2, align 4
  %load10 = load %Bid, %Bid* %r02, align 4
  %gep11 = getelementptr inbounds %Bid, %Bid* %r02, i32 0, i32 0
  %load12 = load i128, i128* %gep11, align 4
  %load13 = load %Bid, %Bid* %r13, align 4
  %gep14 = getelementptr inbounds %Bid, %Bid* %r13, i32 0, i32 0
  %load15 = load i128, i128* %gep14, align 4
  %cast_bool = icmp ne i64 %load9, 0
  %ternary = select i1 %cast_bool, i128 %load12, i128 %load15
  %r3 = alloca i128, align 8
  store i128 %ternary, i128* %r3, align 4
  %load16 = load i64, i64* %r2, align 4
  %load17 = load %Bid, %Bid* %r02, align 4
  %gep18 = getelementptr inbounds %Bid, %Bid* %r02, i32 0, i32 1
  %load19 = load i64, i64* %gep18, align 4
  %load20 = load %Bid, %Bid* %r13, align 4
  %gep21 = getelementptr inbounds %Bid, %Bid* %r13, i32 0, i32 1
  %load22 = load i64, i64* %gep21, align 4
  %cast_bool23 = icmp ne i64 %load16, 0
  %ternary24 = select i1 %cast_bool23, i64 %load19, i64 %load22
  %r4 = alloca i64, align 8
  store i64 %ternary24, i64* %r4, align 4
  %load25 = load i64, i64* %r2, align 4
  %load26 = load %Bid, %Bid* %r02, align 4
  %gep27 = getelementptr inbounds %Bid, %Bid* %r02, i32 0, i32 2
  %load28 = load i128, i128* %gep27, align 4
  %load29 = load %Bid, %Bid* %r13, align 4
  %gep30 = getelementptr inbounds %Bid, %Bid* %r13, i32 0, i32 2
  %load31 = load i128, i128* %gep30, align 4
  %cast_bool32 = icmp ne i64 %load25, 0
  %ternary33 = select i1 %cast_bool32, i128 %load28, i128 %load31
  %r5 = alloca i128, align 8
  store i128 %ternary33, i128* %r5, align 4
  %load34 = load i64, i64* %r2, align 4
  %load35 = load %Bid, %Bid* %r02, align 4
  %gep36 = getelementptr inbounds %Bid, %Bid* %r02, i32 0, i32 3
  %load37 = load i64, i64* %gep36, align 4
  %load38 = load %Bid, %Bid* %r13, align 4
  %gep39 = getelementptr inbounds %Bid, %Bid* %r13, i32 0, i32 3
  %load40 = load i64, i64* %gep39, align 4
  %cast_bool41 = icmp ne i64 %load34, 0
  %ternary42 = select i1 %cast_bool41, i64 %load37, i64 %load40
  %r6 = alloca i64, align 8
  store i64 %ternary42, i64* %r6, align 4
  %load43 = load i64, i64* %r2, align 4
  %load44 = load %Bid, %Bid* %r02, align 4
  %gep45 = getelementptr inbounds %Bid, %Bid* %r02, i32 0, i32 4
  %load46 = load i1, i1* %gep45, align 1
  %load47 = load %Bid, %Bid* %r13, align 4
  %gep48 = getelementptr inbounds %Bid, %Bid* %r13, i32 0, i32 4
  %load49 = load i1, i1* %gep48, align 1
  %cast_bool50 = icmp ne i64 %load43, 0
  %ternary51 = select i1 %cast_bool50, i1 %load46, i1 %load49
  %r7 = alloca i1, align 1
  store i1 %ternary51, i1* %r7, align 1
  %load52 = load i128, i128* %r3, align 4
  %load53 = load i64, i64* %r4, align 4
  %load54 = load i128, i128* %r5, align 4
  %load55 = load i64, i64* %r6, align 4
  %load56 = load i1, i1* %r7, align 1
  %struct = alloca %Bid, align 8
  %struct_gep = getelementptr inbounds %Bid, %Bid* %struct, i32 0, i32 0
  store i128 %load52, i128* %struct_gep, align 4
  %struct_gep57 = getelementptr inbounds %Bid, %Bid* %struct, i32 0, i32 1
  store i64 %load53, i64* %struct_gep57, align 4
  %struct_gep58 = getelementptr inbounds %Bid, %Bid* %struct, i32 0, i32 2
  store i128 %load54, i128* %struct_gep58, align 4
  %struct_gep59 = getelementptr inbounds %Bid, %Bid* %struct, i32 0, i32 3
  store i64 %load55, i64* %struct_gep59, align 4
  %struct_gep60 = getelementptr inbounds %Bid, %Bid* %struct, i32 0, i32 4
  store i1 %load56, i1* %struct_gep60, align 1
  %r8 = alloca %Bid, align 8
  %struct61 = load %Bid, %Bid* %struct, align 4
  store %Bid %struct61, %Bid* %r8, align 4
  br label %exit

exit:                                             ; preds = %body
  %load62 = load %Bid, %Bid* %r8, align 4
  ret %Bid %load62
}

define %Bid @finish(i128 %self.caller, %Bid %r0) {
entry:
  %self.caller1 = alloca i128, align 8
  store i128 %self.caller, i128* %self.caller1, align 4
  %r02 = alloca %Bid, align 8
  store %Bid %r0, %Bid* %r02, align 4
  br label %body

body:                                             ; preds = %entry
  %load = load i128, i128* %self.caller1, align 4
  call void @aleo.assert.eq.i128.i128(i128 %load, i128 0)
  %load3 = load %Bid, %Bid* %r02, align 4
  %gep = getelementptr inbounds %Bid, %Bid* %r02, i32 0, i32 2
  %load4 = load i128, i128* %gep, align 4
  %load5 = load %Bid, %Bid* %r02, align 4
  %gep6 = getelementptr inbounds %Bid, %Bid* %r02, i32 0, i32 1
  %load7 = load i64, i64* %gep6, align 4
  %load8 = load %Bid, %Bid* %r02, align 4
  %gep9 = getelementptr inbounds %Bid, %Bid* %r02, i32 0, i32 2
  %load10 = load i128, i128* %gep9, align 4
  %load11 = load %Bid, %Bid* %r02, align 4
  %gep12 = getelementptr inbounds %Bid, %Bid* %r02, i32 0, i32 3
  %load13 = load i64, i64* %gep12, align 4
  %struct = alloca %Bid, align 8
  %struct_gep = getelementptr inbounds %Bid, %Bid* %struct, i32 0, i32 0
  store i128 %load4, i128* %struct_gep, align 4
  %struct_gep14 = getelementptr inbounds %Bid, %Bid* %struct, i32 0, i32 1
  store i64 %load7, i64* %struct_gep14, align 4
  %struct_gep15 = getelementptr inbounds %Bid, %Bid* %struct, i32 0, i32 2
  store i128 %load10, i128* %struct_gep15, align 4
  %struct_gep16 = getelementptr inbounds %Bid, %Bid* %struct, i32 0, i32 3
  store i64 %load13, i64* %struct_gep16, align 4
  %struct_gep17 = getelementptr inbounds %Bid, %Bid* %struct, i32 0, i32 4
  store i1 true, i1* %struct_gep17, align 1
  %r1 = alloca %Bid, align 8
  %struct18 = load %Bid, %Bid* %struct, align 4
  store %Bid %struct18, %Bid* %r1, align 4
  br label %exit

exit:                                             ; preds = %body
  %load19 = load %Bid, %Bid* %r1, align 4
  ret %Bid %load19
}
