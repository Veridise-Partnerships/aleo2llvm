; ModuleID = 'main.aleo'
source_filename = "./test/toy-examples/map/main.aleo"

@balances = internal global [512 x i64] zeroinitializer

define void @main.finalize(i128 %r0, i64 %r1) {
entry:
  %r01 = alloca i128, align 8
  store i128 %r0, i128* %r01, align 4
  %r12 = alloca i64, align 8
  store i64 %r1, i64* %r12, align 4
  br label %body

body:                                             ; preds = %entry
  %load = load i128, i128* %r01, align 4
  %r2 = alloca i64, align 8
  %array_gep = getelementptr [512 x i64], [512 x i64]* @balances, i32 0, i128 %load
  %load3 = load i64, i64* %array_gep, align 4
  %is_null = icmp eq i64 %load3, 0
  br i1 %is_null, label %then, label %else

then:                                             ; preds = %body
  store i64 0, i64* %array_gep, align 4
  store i64 0, i64* %r2, align 4
  br label %merge

else:                                             ; preds = %body
  store i64 %load3, i64* %r2, align 4
  br label %merge

merge:                                            ; preds = %else, %then
  %load4 = load i64, i64* %r12, align 4
  %load5 = load i64, i64* %r2, align 4
  %add = add i64 %load4, %load5
  %r3 = alloca i64, align 8
  store i64 %add, i64* %r3, align 4
  %load6 = load i128, i128* %r01, align 4
  %load7 = load i64, i64* %r3, align 4
  %array_gep8 = getelementptr [512 x i64], [512 x i64]* @balances, i32 0, i128 %load6
  store i64 %load7, i64* %array_gep8, align 4
  ret void
}

define i64 @main(i128 %self.caller, i128 %r0, i64 %r1) {
entry:
  %self.caller1 = alloca i128, align 8
  store i128 %self.caller, i128* %self.caller1, align 4
  %r02 = alloca i128, align 8
  store i128 %r0, i128* %r02, align 4
  %r13 = alloca i64, align 8
  store i64 %r1, i64* %r13, align 4
  br label %body

body:                                             ; preds = %entry
  br label %exit

exit:                                             ; preds = %body
  %load = load i128, i128* %r02, align 4
  %load4 = load i64, i64* %r13, align 4
  call void @main.finalize(i128 %load, i64 %load4)
  %load5 = load i64, i64* %r13, align 4
  ret i64 %load5
}
