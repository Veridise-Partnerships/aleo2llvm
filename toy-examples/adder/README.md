# adder.aleo

The project includes an example of revealing private data in a Leo program.  
Adding the private variable r0 to the public variable r1 and returning the sum as public data leaks information about the private variable.

```js
function main:
    input r0 as u32.private;
    input r1 as u32.public;
    add r0 r1 into r2;
    output r2 as u32.public;
```

## Build Guide

To compile this Aleo program, run:
```bash
aleo build
```

To run this Aleo program, run:
```bash
aleo run main 1u32 0u32
```
