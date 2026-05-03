{ osConfig, ... }:
{
  rum.programs.fuzzel = {
    inherit (osConfig.graphical) enable;

    settings = {
      main = {
        width = 64;
        font = "${osConfig.fonts.preferredName}:size=${
          builtins.toString (osConfig.fonts.preferredSize + 3)
        }";
      };

      colors = with osConfig.scheme; {
        background = "${base00}ff";
        text = "${base05}ff";
        match = "${base0D}ff";
        selection = "${base03}ff";
        selection-text = "${base06}ff";
        selection-match = "${base0D}ff";
        border = "${base05}ff";
      };
    };
  };
}
