{
  config,
  lib,
  ...
}: let
  cfg = config.profiles.development.clangd;
  inherit (lib) mkEnableOption mkIf;
in {
  options.profiles.development.clangd.enable =
    mkEnableOption "" // {default = config.profiles.development.enable;};

  config = mkIf cfg.enable {
    xdg.configFile."clangd/config.yaml".text = ''
      CompileFlags:
        Add: [
          -Wall,
        ]
    '';
  };
}
