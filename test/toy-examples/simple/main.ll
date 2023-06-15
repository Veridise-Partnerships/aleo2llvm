; ModuleID = 'main.aleo'
source_filename = "./test/toy-examples/simple/main.aleo"

define i32 @main(i128 %self.caller, i32 %r0) {
entry:
  %self.caller1 = alloca i128, align 8
  store i128 %self.caller, i128* %self.caller1, align 4
  %r02 = alloca i32, align 4
  store i32 %r0, i32* %r02, align 4
  br label %body

body:                                             ; preds = %entry
  br label %exit

exit:                                             ; preds = %body
  %load = load i32, i32* %r02, align 4
  ret i32 %load
}
