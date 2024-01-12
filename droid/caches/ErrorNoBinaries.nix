{
  config,
  lib,
  ...
}: let
  inherit (lib) mkEnableOption mkIf;
in {
  options.caches.ErrorNoBinaries = {
    enable =
      mkEnableOption ""
      // {
        default = true;
      };

    internal =
      mkEnableOption ""
      // {
        default = true;
      };
    external =
      mkEnableOption ""
      // {
        default = true;
      };
    cachix =
      mkEnableOption ""
      // {
        default = true;
      };
  };

  config = mkIf config.caches.ErrorNoBinaries.enable {
    nix = {
      substituters = with config.caches.ErrorNoBinaries; [
        (mkIf internal "http://192.168.0.100:7454/ErrorNoBinaries")
        (mkIf external "https://errornointernet.dynv6.net:7455/ErrorNoBinaries")
        (mkIf cachix "https://errornobinaries.cachix.org")
      ];
      trustedPublicKeys = [
        "ErrorNoBinaries:im2fJ1t41XAwp2S+DMgSI0VFKxS+jpz/XIOs/s9iLFg="
        "errornobinaries.cachix.org-1:84oagGNCIsXxBTYmfTiP+lvWje7lIS294iqAtCpFsbU="
      ];
    };
  };
}
