// The 'map.aleo' program.
program map.aleo;

// Public on-chain storage of an `balances` map, with `owner` as the key,
// and `amount` as the value.
mapping balances:
    key owner as address.public;
    value amount as u64.public;

function main:
    input r0 as address.private;
    input r1 as u64.private;
    output r1 as u64.private;

    finalize r0 r1;

finalize main:
    // Input the owner.
    input r0 as address.public;
    // Input the token amount.
    input r1 as u64.public;

    // Increments `balances[r0]` by `r1`.
    // If `balances[r0]` does not exist, it will be created.
    // If `balances[r0] + r1` overflows, `main` is reverted.
    increment balances[r0] by r1;