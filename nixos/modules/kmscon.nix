{
  config,
  lib,
  pkgs,
  ...
}:
let
  cfg = config.kmscon;
  inherit (lib)
    mkDefault
    mkEnableOption
    mkIf
    mkOption
    types
    ;
in
{
  options.kmscon = {
    enable = mkEnableOption "";

    dpmsTimeout = mkOption {
      type = types.int;
      default = 900;
    };
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
      ];

      hwRender = mkDefault true;
      term = "xterm-256color";

      extraConfig = ''
        dpms-timeout = ${builtins.toString cfg.dpmsTimeout}
        font-size = ${builtins.toString (config.fonts.preferredSize + 3)}

        xkb-repeat-delay = ${builtins.toString config.graphical.repeatDelay}
        xkb-repeat-rate = ${builtins.toString config.graphical.repeatRate}
      '';
    };
  };
}
