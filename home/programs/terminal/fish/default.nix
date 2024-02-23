{
  config,
  lib,
  pkgs,
  ...
}: let
  cfg = config.customPrograms.terminal.fish;
  inherit (lib) mkEnableOption mkIf;
in {
  imports = [
    ./abbreviations
    ./aliases.nix
    ./functions.nix
    ./keybinds.nix
    ./theme.nix
  ];

  options.customPrograms.terminal.fish.enable =
    mkEnableOption ""
    // {
      default = true;
    };

  config = mkIf cfg.enable {
    programs.fish = {
      enable = true;
      plugins = with pkgs.fishPlugins; [
        {
          name = "autopair";
          inherit (autopair) src;
        }
      ];
      interactiveShellInit = ''
        set -x _ZO_MAXAGE 20000
        set -x _ZO_RESOLVE_SYMLINKS 1
      '';
    };
  };
}
