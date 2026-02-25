{
  config,
  lib,
  self,
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
    bore = mkEnableOption "";

    qol = mkEnableOption "";
  };

  config = {
    boot.kernelPatches =
      let
        majorMinor = lib.versions.majorMinor config.boot.kernelPackages.kernel.version;
      in
      (optionals cfg.bore [
        {
          name = "bore";
          patch = "${self.pins.kernel-patches}/${majorMinor}/sched/0001-bore.patch";
        }
      ])
      ++ (optionals cfg.qol [
        {
          name = "drm_panic";
          patch = null;
          structuredExtraConfig = with lib.kernel; {
            DRM_PANIC_SCREEN = lib.mkForce (freeform "qr_code");
            DRM_PANIC_SCREEN_QR_CODE_URL = freeform "https://kdj0c.github.io/panic_report/";
          };
        }
      ]);
  };
}
