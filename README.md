# aleo2llvm
`aleo2llvm` is a lightweight LLVM frontend compiling Aleo instructions to LLVM IR. It's built upon Aleo's [snarkVM](https://github.com/AleoHQ/snarkVM/).

## Building and Installing

To build `aleo2llvm` and install a command-line shotcut to it, run the following command:

```bash
cargo install --path .
```

## Usage

You can directly call `aleo2llvm` from command-line:

```bash
aleo2llvm <DIR_OF_ALEO_PROJ>
```

where `<DIR_OF_ALEO_PROJ>` points to the root folder of your Aleo project.

For example:

```bash
aleo2llvm ./test/toy-examples/adder/
```

This outputs two files:

- A `*.ll` file of the transpiled LLVM IRs.
- A `*.json` file of a summary that provides detailed metadata/info of the target Aleo project, e.g., types and mapping of variables. The summary file will be useful for downstream tasks that depend on LLVM IR, e.g., a static analyzer, symbolic execution, etc.

Alternatively, to do a quick testing without installation, just do:

```bash
cargo run <DIR_OF_ALEO_PROJ>
```

For example:

```bash
cargo run ./test/toy-examples/adder/
```