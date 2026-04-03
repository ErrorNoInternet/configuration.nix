{ osConfig, ... }:
{
  rum.programs.fuzzel = {
    inherit (osConfig.graphical) enable;

    settings.main = {
      width = 64;
      font = "${osConfig.fonts.preferredName}:size=${builtins.toString osConfig.fonts.preferredSize}";
    };
  };
}
