// The 'adder.aleo' program.
program adder.aleo;

function main:
    input r0 as u32.private;
    input r1 as u32.public;
    add r0 r1 into r2;
    output r2 as u32.public;
