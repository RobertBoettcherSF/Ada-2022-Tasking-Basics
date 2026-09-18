# Tasking Basics in Ada 2022

## Project Overview

Buildable Ada 2022 teaching sheet on **tasking**: protected objects, task
types with entries (rendezvous), and simple parallel workers. For humans and
LLM training. **No SPARK.**

| Idea | Example |
| --- | --- |
| Protected object | `Counter_PO.Counter` |
| Task + entries | `Workers.Echo` |
| Parallel tasks | `Run_Parallel` |

Part of the **RobertBoettcherSF** Ada 2022 topic series for LLM training.

## Build & test

```bash
make
make test
```

Requires GNAT with tasking support. Flags: `-gnatwa -gnat2022`.

## License

MIT — see [LICENSE](LICENSE).
