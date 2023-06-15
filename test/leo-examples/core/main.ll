; ModuleID = 'main.aleo'
source_filename = "./test/leo-examples/core/main.aleo"

define i128 @main(i128 %self.caller, i128 %r0) {
entry:
  %self.caller1 = alloca i128, align 8
  store i128 %self.caller, i128* %self.caller1, align 4
  %r02 = alloca i128, align 8
  store i128 %r0, i128* %r02, align 4
  br label %body

body:                                             ; preds = %entry
  %load = load i128, i128* %r02, align 4
  %hash.bhp256 = call i128 @aleo.hash.bhp256.i128(i128 %load)
  %r1 = alloca i128, align 8
  store i128 %hash.bhp256, i128* %r1, align 4
  %load3 = load i128, i128* %r1, align 4
  %hash.psd2 = call i128 @aleo.hash.psd2.i128(i128 %load3)
  %r2 = alloca i128, align 8
  store i128 %hash.psd2, i128* %r2, align 4
  %load4 = load i128, i128* %r2, align 4
  %commit.bhp256 = call i128 @aleo.commit.bhp256.i128.i128(i128 %load4, i128 1)
  %r3 = alloca i128, align 8
  store i128 %commit.bhp256, i128* %r3, align 4
  br label %exit

exit:                                             ; preds = %body
  %load5 = load i128, i128* %r3, align 4
  ret i128 %load5
}

declare i128 @aleo.hash.bhp256.i128(i128)

declare i128 @aleo.hash.psd2.i128(i128)

declare i128 @aleo.commit.bhp256.i128.i128(i128, i128)
