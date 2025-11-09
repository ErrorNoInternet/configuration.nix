{
  config,
  lib,
  pkgs,
  ...
}:
let
  cfg = config.fonts;
  inherit (lib)
    mkEnableOption
    mkIf
    mkOption
    types
    ;
in
{
  options.fonts = {
    enable = mkEnableOption "";

    preferred = mkOption {
      default = "Iosevka Nerd Font";
      type = types.str;
    };

    preferredSize = mkOption {
      default = 10;
      type = types.int;
    };
  };

  config = mkIf cfg.enable {
    fonts = {
      packages = with pkgs; [
        nerd-fonts.iosevka
        nerd-fonts.jetbrains-mono

        noto-fonts
        noto-fonts-cjk-sans
        noto-fonts-cjk-serif
        source-han-sans
        source-han-serif

        noto-fonts-color-emoji
        twitter-color-emoji
      ];

      fontconfig.defaultFonts = {
        serif = [
          cfg.preferred
          "Noto Serif CJK SC"
        ];
        sansSerif = [
          cfg.preferred
          "Noto Sans CJK SC"
        ];
        monospace = [
          cfg.preferred
        ];
        emoji = [
          "Twitter Color Emoji"
        ];
      };
    };
  };
}
