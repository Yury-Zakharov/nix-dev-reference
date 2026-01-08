{ config, pkgs, lib, ... }:

{
  programs.direnv = {
    enable = true;
    enableBashIntegration = true;

    # Security posture
    nix-direnv.enable = true;

    config = {
      whitelist = {
        prefix = [ "$HOME/dev" ];
      };

      # Do not silently allow .envrc
      disable_stdin = true;
      warn_timeout = "2s";
    };
  };
}
