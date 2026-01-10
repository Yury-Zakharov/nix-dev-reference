# Agent Authentication Model

This repository distinguishes between two authentication classes.

---

## Identity-scoped tools (OAuth)

Examples:
- Gemini CLI
- gh
- gcloud

Characteristics:
- Browser-based login
- Persistent user identity
- Tool-managed credentials
- Stored under `$HOME`
- Not suitable for declarative configuration

Policy:
- Do not manage via Nix
- Do not store secrets manually
- Do not inject environment variables

---

## Secret-scoped tools (API keys)

Examples:
- Claude CLI
- OpenAI tools

Characteristics:
- Static secrets
- Explicit ownership
- Easy rotation
- Non-interactive

Policy:
- Store in `pass`
- Inject via `direnv`
- Never commit
- Never hardcode in Nix

---

## Rationale

This separation minimizes entropy while preserving:
- Security
- Convenience
- Reproducibility
- Clear teardown paths


## Claude vs Gemini (explicit contrast)

| Aspect | Claude | Gemini |
|------|------|------|
| Auth type | API key | OAuth |
| Secret ownership | User | Tool |
| Storage | `pass` | `~/.gemini` |
| Injection | `direnv` | None |
| Re-auth frequency | Never | Rare |
| Declarative | Partially | No |

This asymmetry is intentional and reflects the upstream tooling models.
