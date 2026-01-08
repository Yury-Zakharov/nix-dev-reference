{ pkgs ? import <nixpkgs> {} }:

pkgs.mkShell {
  name = "dotnet-example";

  packages = with pkgs; [
    dotnet-sdk_8
    git
    bash
  ];

  shellHook = ''
    export DOTNET_CLI_TELEMETRY_OPTOUT=1
    export DOTNET_NOLOGO=1
    echo "Entered dotnet-example devShell (SDK 8)"
  '';
}
