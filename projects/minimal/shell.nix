{ pkgs ? import <nixpkgs> {} }:

pkgs.mkShell {
  name = "minimal";

  packages = with pkgs; [
    git
    bash
  ];

  shellHook = ''
    echo "Entered minimal devShell"
  '';
}
