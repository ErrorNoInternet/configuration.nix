{ lib, ... }:
let
  hosts = {
    "100.96.0.1" = {
      ForwardAgent = "yes";
    };
    "error.tuxcord.net" = {
      ForwardAgent = "yes";
    };
    "scout.error.tuxcord.net" = {
      ForwardAgent = "yes";
    };
    "scout.local" = {
      ForwardAgent = "yes";
    };
    "tuxcord.net" = {
      ForwardAgent = "yes";
    };
    "zenith.local" = {
      ForwardAgent = "yes";
    };
    "git.javalsai.tuxcord.net" = {
      Port = "1022";
      User = "gitea";
    };
    "javalsai.tuxcord.net" = {
      Port = "1022";
    };
    "envs.net" = {
      User = "errornointernet";
    };
    "fedorapeople.org" = {
      User = "errornointernet";
    };
  };
in
{
  files.".ssh/config".text = ''
    AddKeysToAgent 1d
    Compression yes
  ''
  +
    lib.attrsets.foldlAttrs
      (
        acc: host: options:
        acc + "Host ${host}\n${options}\n"
      )
      ""
      (
        builtins.mapAttrs (
          _host: options:
          lib.attrsets.foldlAttrs (
            acc: key: value:
            acc + "  ${key} ${value}\n"
          ) "" options
        ) hosts
      );
}
