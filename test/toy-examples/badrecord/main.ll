; ModuleID = 'main.aleo'
source_filename = "./test/toy-examples/badrecord/main.aleo"

%token = type { i128, i64, i64 }

define i128 @main(i128 %self.caller, %token %r0) {
entry:
  %self.caller1 = alloca i128, align 8
  store i128 %self.caller, i128* %self.caller1, align 4
  %r02 = alloca %token, align 8
  store %token %r0, %token* %r02, align 4
  br label %body

body:                                             ; preds = %entry
  br label %exit

exit:                                             ; preds = %body
  %gep = getelementptr inbounds %token, %token* %r02, i32 0, i32 0
  %load = load i128, i128* %gep, align 4
  ret i128 %load
}
