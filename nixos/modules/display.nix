{
  config,
  lib,
  pkgs,
  ...
}:
let
  cfg = config.display;
  inherit (lib)
    mkDefault
    mkEnableOption
    mkIf
    ;
in
{
  options.display = {
    enable = mkEnableOption "";
  };

  config = mkIf cfg.enable {
    services.kmscon = {
      enable = mkDefault true;

      fonts = [
        {
          name = "Iosevka Nerd Font";
          package = pkgs.nerd-fonts.iosevka;
        }
        {
          name = "JetBrainsMonoNL Nerd Font";
          package = pkgs.nerd-fonts.jetbrains-mono;
        }
        {
          name = "Twitter Color Emoji";
          package = pkgs.twitter-color-emoji;
        }
      ];

      hwRender = mkDefault true;
      term = "xterm-256color";

      extraConfig = ''
        font-size = ${builtins.toString (config.fonts.preferredSize + 1)}

        xkb-repeat-delay = ${builtins.toString config.graphical.repeatDelay}
        xkb-repeat-rate = ${builtins.toString config.graphical.repeatRate}
      '';
    };

    environment.systemPackages = with pkgs; [
      brightnessctl
      ddcutil
      timg
    ];
  };
}
