{ lib, osConfig, ... }:
{
  xdg.config.files = lib.mkIf osConfig.graphical.enable {
    "cava/config".text = lib.generators.toINI { } {
      color.theme = "colors";
    };

    "cava/themes/colors".text =
      with lib;
      generators.toINI
        {
          mkKeyValue = generators.mkKeyValueDefault {
            mkValueString = v: if isString v then ''"${v}"'' else generators.mkValueStringDefault { } v;
          } " = ";
        }
        {
          color = with osConfig.scheme.withHashtag; {
            background = base11;
            foreground = base05;

            gradient = 1;
            gradient_color_1 = base13;
            gradient_color_2 = base15;
            gradient_color_3 = base0D;
            gradient_color_4 = base16;
            gradient_color_5 = base0A;
            gradient_color_6 = base09;
            gradient_color_7 = base08;
            gradient_color_8 = base12;

            horizontal_gradient = 1;
            horizontal_gradient_color_1 = base15;
            horizontal_gradient_color_2 = base0C;
            horizontal_gradient_color_3 = base14;
            horizontal_gradient_color_4 = base13;
            horizontal_gradient_color_5 = base0A;
            horizontal_gradient_color_6 = base09;

            blend_direction = "up";
          };
        };
  };
}
