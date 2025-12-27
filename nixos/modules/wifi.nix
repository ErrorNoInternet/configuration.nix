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

  mkNetwork = id: {
    connection = {
      id = "$SSID_${id}";
      type = "wifi";
    };
    ipv4 = {
      method = "auto";
    };
    ipv6 = {
      addr-gen-mode = "default";
      method = "auto";
    };
    wifi = {
      mode = "infrastructure";
      ssid = "$SSID_${id}";
    };
    wifi-security = {
      auth-alg = "open";
      key-mgmt = "wpa-psk";
      psk = "$PSK_${id}";
    };
  };

  mkCustomNetwork =
    id: options:
    {
      connection = {
        id = "$SSID_c${id}";
        type = "wifi";
      };
      ipv4 = {
        method = "auto";
      };
      ipv6 = {
        addr-gen-mode = "default";
        method = "auto";
      };
      wifi = {
        bssid = "$BSSID_c${id}";
        mode = "infrastructure";
        ssid = "$SSID_c${id}";
      };
      wifi-security = {
        auth-alg = "open";
        key-mgmt = "wpa-psk";
        psk = "$PSK_c${id}";
      };
    }
    // options;

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
        };
    };
  };
}
