{ config, pkgs, lib, ... }:

let
  identity = {
    name  = "John Doe";
    email = "john.doe@morgue.com";
    # [expires: 1985-25-12]
    gpgKey = "AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA";
  };
in
{
  programs.git = {
    enable = true;

    settings = {
      user = {
        name  = identity.name;
        email = identity.email;
        signingkey = identity.gpgKey;
      };

      commit.gpgSign = true;
      tag.gpgSign    = true;
      gpg.program    = "gpg";
    };
  };

  home.sessionVariables = {
    GIT_AUTHOR_NAME  = identity.name;
    GIT_AUTHOR_EMAIL = identity.email;
    GIT_COMMITTER_NAME  = identity.name;
    GIT_COMMITTER_EMAIL = identity.email;
  };
}
