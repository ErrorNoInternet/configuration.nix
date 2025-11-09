{ lib, ... }:
{
  xdg.config.files."qalculate/qalc.cfg".text = lib.generators.toINI { } {
    Mode = {
      calculate_as_you_type = 1;
    };
  };
}
