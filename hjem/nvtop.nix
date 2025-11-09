{ lib, ... }:
{
  xdg.config.files."nvtop/interface.ini".text = ''
    [Device]
    Pdev = 0000:01:00.0
    ShownInfo = gpuRate
    ShownInfo = gpuMemRate
    ShownInfo = temperature
    ShownInfo = powerDrawRate
  '';
}
