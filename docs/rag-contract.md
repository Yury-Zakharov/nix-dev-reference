# RAG Contract

This repository defines a local RAG contract.

## Responsibilities

### Project
- Provides source material
- Defines index location

### Tool
- Chooses embedding model
- Manages index format
- Owns lifecycle of embeddings

---

## Directory layout

```bash
.rag/
index/ # tool-managed, disposable
metadata/ # optional
```

---

## Rules

- `.rag/` is gitignored
- Indexes are disposable
- No secrets inside RAG state
- RAG must work offline

---

## Teardown

```bash
rm -rf .rag/
```


Add `.gitignore` entry:

```bash
echo ".rag/" >> .gitignore
```

