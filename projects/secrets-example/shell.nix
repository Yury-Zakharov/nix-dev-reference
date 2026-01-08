{ pkgs ? import <nixpkgs> {} }:

pkgs.mkShell {
  name = "secrets-example";

  packages = with pkgs; [
    pass
    gnupg
    git
    bash
  ];

  shellHook = ''
    echo "Entered secrets-example devShell"
  '';
}
