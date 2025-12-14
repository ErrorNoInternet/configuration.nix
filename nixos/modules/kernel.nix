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
  };

  config = {
    boot.kernelPatches =
      let
        majorMinor = lib.versions.majorMinor config.boot.kernelPackages.kernel.version;
      in
      optionals cfg.bore [
        {
          name = "bore";
          patch = "${self.pins.kernel-patches}/${majorMinor}/sched/0001-bore.patch";
        }
      ];
  };
}
