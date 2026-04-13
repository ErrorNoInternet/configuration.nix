{
  config,
  inputs,
  lib,
  pkgs,
  ...
}:
let
  cfg = config.kernel;
  inherit (lib)
    mkEnableOption
    mkIf
    mkOption
    optionals
    types
    ;
in
{
  options.kernel = {
    cachyos = {
      enable = mkEnableOption "";

      suffix = mkOption {
        type = types.str;
        default = "lto";
      };
    };

    qol.enable = mkEnableOption "";
  };

  config = {
    nixpkgs.overlays = mkIf cfg.cachyos.enable [
      inputs.nix-cachyos-kernel.overlays.default
    ];

    boot = {
      kernelPackages =
        mkIf cfg.cachyos.enable
          pkgs.cachyosKernels."linuxPackages-cachyos-latest-${cfg.cachyos.suffix}";

      kernelPatches = optionals cfg.qol.enable [
        {
          name = "drm_panic";
          patch = null;
          structuredExtraConfig = with lib.kernel; {
            DRM_PANIC_SCREEN = lib.mkForce (freeform "qr_code");
            DRM_PANIC_SCREEN_QR_CODE_URL = freeform "https://kdj0c.github.io/panic_report/";
          };
        }
      ];
    };
  };
}
