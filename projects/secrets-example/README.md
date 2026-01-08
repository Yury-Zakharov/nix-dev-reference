# Secrets Example

This project demonstrates **project-scoped secret injection** using:

- `pass` for storage
- `direnv` for injection
- `nix-shell` for isolation

## Required secrets

The following secrets must exist in `pass`:

- dev/secrets-example/local/github-token
- dev/secrets-example/local/postgres-password

They are exposed inside the devShell as:

- GITHUB_TOKEN
- POSTGRES_PASSWORD

No secrets are stored in this repository.
