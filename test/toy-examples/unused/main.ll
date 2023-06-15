; ModuleID = 'main.aleo'
source_filename = "./test/toy-examples/unused/main.aleo"

define i64 @main(i128 %self.caller, i64 %r0, i64 %r1, i64 %r2) {
entry:
  %self.caller1 = alloca i128, align 8
  store i128 %self.caller, i128* %self.caller1, align 4
  %r02 = alloca i64, align 8
  store i64 %r0, i64* %r02, align 4
  %r13 = alloca i64, align 8
  store i64 %r1, i64* %r13, align 4
  %r24 = alloca i64, align 8
  store i64 %r2, i64* %r24, align 4
  br label %body

body:                                             ; preds = %entry
  %load = load i64, i64* %r02, align 4
  %load5 = load i64, i64* %r13, align 4
  %add = add i64 %load, %load5
  %r3 = alloca i64, align 8
  store i64 %add, i64* %r3, align 4
  br label %exit

exit:                                             ; preds = %body
  %load6 = load i64, i64* %r3, align 4
  ret i64 %load6
}
