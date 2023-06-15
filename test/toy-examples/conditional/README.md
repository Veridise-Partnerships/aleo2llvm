# conditional.aleo

The project includes an example of revealing private data in a Leo program.  
This program reveals the private value of `r0` by selecting `true` or `false` in a ternary expression and return the value publically.

```js
function main:
    input r0 as boolean.private;
    ternary r0 true false into r1;
    output r1 as boolean.public;
```


## Build Guide

To compile this Aleo program, run:
```bash
aleo build
```

To run this Aleo program, run:
```bash
aleo run main true
```