; ModuleID = 'main.aleo'
source_filename = "./test/toy-examples/conditional/main.aleo"

define i1 @main(i128 %self.caller, i1 %r0) {
entry:
  %self.caller1 = alloca i128, align 8
  store i128 %self.caller, i128* %self.caller1, align 4
  %r02 = alloca i1, align 1
  store i1 %r0, i1* %r02, align 1
  br label %body

body:                                             ; preds = %entry
  %load = load i1, i1* %r02, align 1
  %ternary = select i1 %load, i1 true, i1 false
  %r1 = alloca i1, align 1
  store i1 %ternary, i1* %r1, align 1
  br label %exit

exit:                                             ; preds = %body
  %load3 = load i1, i1* %r1, align 1
  ret i1 %load3
}
