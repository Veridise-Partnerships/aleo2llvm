# badrecord.aleo
The project includes an example of revealing private `record` data in a Leo program.
`record` variables are private by default, outputting them as public is a vulnerability.

## Build Guide

To compile this Aleo program, run:
```bash
aleo build
```

```bash
aleo run main "{
  owner: aleo1s96ejajagmnxhcvcpklssfmmsedgm9uer8tunzpunrsmdh9d0cqslusckh.private,
  gates: 0u64.private,
  amount: 100u64.private,
  _nonce: 0group.public
}"
```