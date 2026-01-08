# Agent Example

This project demonstrates a **project-scoped coding agent** with:

- Node-based CLI
- Secrets via pass + direnv
- Local cache and RAG indexes
- Zero global state

## Required secrets

``` bash
pass insert dev/agent-example/local/claude-api-key

pass insert dev/agent-example/local/claude-base-url

```


## Derived data

The following directories are created at runtime and are disposable:

- `.cache/`
- `.rag/`

They are ignored by git.

