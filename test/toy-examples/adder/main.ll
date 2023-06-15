; ModuleID = 'main.aleo'
source_filename = "./test/toy-examples/adder/main.aleo"

define i32 @main(i128 %self.caller, i32 %r0, i32 %r1) {
entry:
  %self.caller1 = alloca i128, align 8
  store i128 %self.caller, i128* %self.caller1, align 4
  %r02 = alloca i32, align 4
  store i32 %r0, i32* %r02, align 4
  %r13 = alloca i32, align 4
  store i32 %r1, i32* %r13, align 4
  br label %body

body:                                             ; preds = %entry
  %load = load i32, i32* %r02, align 4
  %load4 = load i32, i32* %r13, align 4
  %add = add i32 %load, %load4
  %r2 = alloca i32, align 4
  store i32 %add, i32* %r2, align 4
  br label %exit

exit:                                             ; preds = %body
  %load5 = load i32, i32* %r2, align 4
  ret i32 %load5
}
