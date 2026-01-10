# Claude CLI (API-key based)

## Classification

Claude CLI is treated as a **secret-scoped tool**.

- Authentication is performed via a static API key
- The user owns and manages the secret
- The tool does not persist identity state
- Secrets must not be committed or hardcoded

This differs intentionally from OAuth-based tools such as Gemini CLI.

---

## Authentication Model

Claude CLI requires an API key provided via environment variable:

```bash

ANTHROPIC_AUTH_TOKEN
```


The key is:

- Stored securely using `pass`
- Injected at shell entry via `direnv`
- Never stored in the repository
- Never referenced in Nix expressions

---

## Secret Storage

Claude API key is stored in the password store:

`pass/api/claude`


Example:

```bash
pass insert api/claude
```

## Injection via direnv

Each project that uses Claude defines secret injection explicitly.

Example .envrc:

```bash
export ANTHROPIC_API_KEY="$(pass show api/claude)"
```

This ensures:

- Secrets exist only in interactive shells

- Teardown is automatic when leaving the directory

- No global environment pollution

## What NOT to do

- Do not store API keys in shell.nix

- Do not commit .envrc

- Do not export Claude secrets globally

- Do not rely on implicit shell state

## Teardown

To revoke Claude access:

```bash
pass rm api/claude
```

Subsequent shell entry will fail fast, as intended.

