# Gemini CLI (OAuth-based)

## Classification

Gemini CLI is treated as **identity-scoped tooling**, not secret-scoped tooling.

- The executable is provided by the project devShell
- Authentication is performed via browser OAuth
- Credentials are managed by the tool itself
- No API keys are used
- No secrets are injected via environment variables

This mirrors tools such as `gh` or `gcloud`.

---

## Authentication Flow

Inside a devShell that provides `gemini`:

```bash
gemini chat
```

## Credential Storage

Gemini stores its authentication state in:

```bash
~/.gemini/
```

This directory is:

- User-scoped

- Persistent across shells

- Outside the repository

- Not managed by Nix

- Not committed to version control

This is intentional.

## What NOT to do

- Do not set GEMINI_API_KEY

- Do not store Gemini credentials in pass

- Do not inject Gemini auth via .envrc

- Do not attempt to make Gemini auth declarative
 Gemini OAuth is mutable identity state, not configuration.

## Teardown

To remove Gemini credentials completely:

```bash
rm -rf ~/.gemini
```

Next invocation will require re-authentication.
