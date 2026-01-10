{ pkgs ? import <nixpkgs> {} }:

pkgs.mkShell {
  name = "dotnet-example";

  packages = with pkgs; [
    dotnet-sdk_8
    git
    bash
  ];

  shellHook = ''
    export DOTNET_ROOT=${pkgs.dotnet-sdk_8}
    export DOTNET_CLI_TELEMETRY_OPTOUT=1
    export DOTNET_NOLOGO=1
    echo ">> .NET SDK: $(dotnet --version)"
  '';
}
