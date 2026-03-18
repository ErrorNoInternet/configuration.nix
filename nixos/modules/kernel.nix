{
  config,
  lib,
  ...
}:
let
  cfg = config.kernel;
  inherit (lib)
    mkEnableOption
    optionals
    ;
in
{
  options.kernel = {
    qol = mkEnableOption "";
  };

  config = {
    boot.kernelPatches = optionals cfg.qol [
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
}
