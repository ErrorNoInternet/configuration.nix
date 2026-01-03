{ osConfig, ... }:
{
  rum.programs.fuzzel = {
    inherit (osConfig.graphical) enable;

    settings.main = {
      width = 64;
      font = "${osConfig.fonts.preferred}:size=${builtins.toString osConfig.fonts.preferredSize}";
    };
  };
}
