{
  config,
  inputs,
  lib,
  pkgs,
  ...
}: let
  cfg = config.customPrograms.wleave;
  inherit (lib) mkEnableOption mkOption mkIf types;
in {
  options.customPrograms.wleave = {
    enable = mkEnableOption "" // {default = config.profiles.windowManager.enable;};

    height = mkOption {
      type = types.numbers.between 0 1;
      default = 0.5;
    };
  };

  config = mkIf cfg.enable {
    programs.wlogout = {
      enable = true;
      package = pkgs.wleave;

      layout = with cfg; [
        {
          label = "suspend";
          text = "";
          action = "systemctl suspend";
          keybind = "s";
          inherit height;
        }
        {
          label = "reboot";
          text = "";
          action = "reboot";
          keybind = "r";
          inherit height;
        }
        {
          label = "shutdown";
          text = "";
          action = "poweroff";
          keybind = "p";
          inherit height;
        }
        {
          label = "logout";
          text = "󰗽";
          action = "hyprctl dispatch exit";
          keybind = "e";
          inherit height;
        }
        {
          label = "lock";
          text = "";
          action = "sleep 0.5 && swaylock --grace 0 --fade-in 1";
          keybind = "l";
          inherit height;
        }
      ];
      style = with config.colors.scheme.palette; ''
        window {
          background-color: rgba(${
          inputs.nix-colors.lib.conversions.hexToRGBString
          ","
          base00
        },${builtins.toString config.opacity.bar});
        }

        button {
          font-size: 72px;
          background-color: #${base01};
          color: #${base04};
          margin: 6px;
          border-radius: 16px;
        }

        button:hover {
          background-color: #${base03};
          color: #${base0D};
          transition: all 0.2s ease-in-out;
        }
      '';
    };
  };
}
