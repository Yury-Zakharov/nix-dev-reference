#!/usr/bin/env bash
set -euo pipefail

MODE="${1:-}"

if [[ -z "$MODE" ]]; then
  echo "Usage: agent-pair.sh <analyze|design|review>"
  exit 1
fi

case "$MODE" in
  analyze)
    echo "== Gemini: structural analysis =="
    gemini chat < agents/prompts/gemini-analyze.md
    ;;
  design)
    echo "== Gemini: problem framing =="
    gemini chat <<'EOF'
Given the current repository, outline possible design directions
and trade-offs at a high level.
EOF

    echo
    echo "== Claude: synthesis and decision =="
    claude <<'EOF'
Given the design directions proposed above,
produce a concrete recommendation with rationale.
EOF
    ;;
  review)
    echo "== Gemini: factual scan =="
    gemini chat <<'EOF'
Scan the repository for inconsistencies, dead code,
or configuration mismatches.
EOF

    echo
    echo "== Claude: reasoning review =="
    claude <<'EOF'
Based on the issues found above,
prioritize fixes and explain why they matter.
EOF
    ;;
  *)
    echo "Unknown mode: $MODE"
    exit 1
    ;;
esac
