{
  config,
  lib,
  self,
  ...
}: let
  cfg = config.workstation.modules.nvidia;
in {
  specialisation = with self.lib.systems;
    lib.mkIf cfg.enable {
      no-nvidia = mkSpecialisation "no-nvidia" {
        workstation.modules.nvidia.enable = false;
      };
    };
}
