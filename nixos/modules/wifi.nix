{
  config,
  lib,
  self,
  ...
}:
let
  networkCount = 8;

  cfg = config.wifi;
  inherit (lib)
    mkEnableOption
    mkIf
    ;
  inherit (lib.attrsets) recursiveUpdate;

  defaultOptions = {
    connection.type = "wifi";
    ipv4.method = "auto";
    ipv6 = {
      addr-gen-mode = "default";
      method = "auto";
    };
    wifi.mode = "infrastructure";
    wifi-security = {
      auth-alg = "open";
      key-mgmt = "wpa-psk";
    };
  };

  mkNetwork =
    id:
    (recursiveUpdate {
      connection.id = "$SSID_${id}";
      wifi.ssid = "$SSID_${id}";
      wifi-security.psk = "$PSK_${id}";
    } defaultOptions);

  mkCustomNetwork =
    id: options:
    (recursiveUpdate (recursiveUpdate {
      connection.id = "$SSID_c${id}";
      wifi = {
        bssid = "$BSSID_c${id}";
        ssid = "$SSID_c${id}";
      };
      wifi-security.psk = "$PSK_c${id}";
    } defaultOptions) options);

in
{
  options.wifi = {
    enable = mkEnableOption "";
  };

  config = mkIf cfg.enable {
    age.secrets.wifi.file = "${self}/agenix/wifi.age";

    networking.networkmanager.ensureProfiles = {
      environmentFiles = [ config.age.secrets.wifi.path ];

      profiles =
        builtins.listToAttrs (
          builtins.genList (n: {
            name = "network_${builtins.toString n}";
            value = mkNetwork (builtins.toString n);
          }) networkCount
        )
        // {
          custom-network_0 = mkCustomNetwork "0" { wifi.cloned-mac-address = "permanent"; };
          custom-network_1 = mkCustomNetwork "1" { connection.autoconnect-priority = 1; };
        };
    };
  };
}
