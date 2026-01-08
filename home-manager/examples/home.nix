{ config, pkgs, ... }:

{
  imports = [
    ../modules/identity.nix
    ../modules/ssh.nix
    ../modules/secrets.nix
    ../modules/direnv.nix
  ];

  home.username = "john";
  home.homeDirectory = "/home/john";

  home.stateVersion = "25.11";
}
