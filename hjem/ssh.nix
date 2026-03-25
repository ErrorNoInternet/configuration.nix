{ lib, ... }:
let
  hosts = [
    "100.96.0.1"
    "error.tuxcord.net"
    "scout.error.tuxcord.net"
    "scout.local"
    "tuxcord.net"
    "zenith.local"
  ];
in
{
  files.".ssh/config".text = ''
    AddKeysToAgent 1d
    Compression yes
  ''
  + (lib.concatStringsSep "\n" (
    map (host: ''
      Host ${host}
        ForwardAgent yes'') hosts
  ));
}
