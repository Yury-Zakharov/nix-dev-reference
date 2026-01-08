{ config, pkgs, lib, ... }:

{
  programs.ssh = {
    enable = true;

    # Do not rely on implicit defaults
    enableDefaultConfig = false;

    matchBlocks = {
      # Global defaults
      "*" = {
        addKeysToAgent = "no";
        identitiesOnly = false;
      };

      # GitHub-specific behavior
      "github.com" = {
        user = "git";
        identityFile = "~/.ssh/id_ed25519";
        identitiesOnly = true;
        addKeysToAgent = "no";
      };
    };
  };

  # Route SSH through gpg-agent
  home.sessionVariables = {
    SSH_AUTH_SOCK = "$XDG_RUNTIME_DIR/gnupg/S.gpg-agent.ssh";
  };
}
