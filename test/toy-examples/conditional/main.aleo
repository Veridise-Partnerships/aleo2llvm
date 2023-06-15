// The 'conditional.aleo' program.
program conditional.aleo;

function main:
    input r0 as boolean.private;
    ternary r0 true false into r1;
    output r1 as boolean.public;
