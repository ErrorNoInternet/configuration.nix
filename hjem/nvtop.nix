{ lib, osConfig, ... }:
{
  xdg.config.files = lib.mkIf osConfig.graphical.enable {
    "nvtop/interface.ini".text = ''
      [Device]
      Pdev = 0000:01:00.0
      ShownInfo = gpuRate
      ShownInfo = gpuMemRate
      ShownInfo = temperature
      ShownInfo = powerDrawRate
    '';
  };
}
