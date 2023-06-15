# simple.aleo

The project includes a minimal example of revealing private data in a Leo program.  
Returning the private variable `r0` as public is a vulnerability.

```js
function main:
    input r0 as u32.private;
    output r0 as u32.public;
```

## Build Guide

To compile this Aleo program, run:
```bash
aleo build
```

To run this Aleo program, run:
```bash
aleo run main 1u32
```