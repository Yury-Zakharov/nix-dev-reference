{ config, pkgs, lib, ... }:

{
  ### 1. Enable secret backends (capabilities, not data)

  programs.password-store = {
    enable = true;
  };

  programs.gpg = {
    enable = true;
  };

  services.gpg-agent = {
    enable = true;
    enableSshSupport = true;
    defaultCacheTtl = 86400;
    maxCacheTtl = 86400;

    pinentry.package = pkgs.pinentry-tty;
  };
  
  ### 2. Define secret discovery conventions

  home.sessionVariables = {
    # Canonical root for secret lookup
    SECRETS_BACKEND = "pass";

    # Convention: tools read from pass via helper scripts
    PASS_ENABLE_EXTENSIONS = "true";

    # Optional: standard location for per-project secret adapters
    SECRETS_DIR = "$HOME/.secrets";
  };

  ### 3. Explicit prohibitions (documented via assertions)

  assertions = [
    {
      assertion = !(config.home.sessionVariables ? GITHUB_TOKEN);
      message = "Do not export secrets directly via Home Manager.";
    }
  ];
}
