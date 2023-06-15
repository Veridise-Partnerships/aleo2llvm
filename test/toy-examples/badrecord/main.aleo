// The 'badrecord.aleo' program.
program badrecord.aleo;

record token:
    // The token owner.
    owner as address.private;
    // The Aleo balance (in gates).
    gates as u64.private;
    // The token amount.
    amount as u64.private;

function main:
    input r0 as token.record;
    output r0.owner as address.public;
