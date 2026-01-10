{ pkgs ? import <nixpkgs> {
    config.allowUnfree = true;
  }
}:

pkgs.mkShell {
  name = "agent-example";

  packages = with pkgs; [
    claude-code
    gemini-cli
    git
    bash
  ];

  shellHook = ''
    # Project-local, non-secret state
    export CLAUDE_CACHE_DIR="$PWD/.cache/claude"
    export RAG_INDEX_DIR="$PWD/.rag/index"

    mkdir -p "$CLAUDE_CACHE_DIR" "$RAG_INDEX_DIR"

    echo "Entered agent-example devShell"
    echo "Claude: $(claude --version 2>/dev/null || true)"
    echo "Gemini: $(gemini --version 2>/dev/null || true)"
  '';
}
