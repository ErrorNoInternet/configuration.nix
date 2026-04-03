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

    preferredPackage = mkOption {
      default = pkgs.nerd-fonts.iosevka;
      type = types.package;
    };

    preferredName = mkOption {
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
        cfg.preferredPackage

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
          cfg.preferredName
          "Noto Serif CJK SC"
        ];
        sansSerif = [
          cfg.preferredName
          "Noto Sans CJK SC"
        ];
        monospace = [
          cfg.preferredName
        ];
        emoji = [
          "Twitter Color Emoji"
        ];
      };
    };
  };
}
