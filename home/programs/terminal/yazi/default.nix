{
  config,
  lib,
  ...
}: {
  imports = [
    ./keymaps.nix
    ./open.nix
    ./plugins.nix
    ./theme.nix
  ];

  config = lib.mkIf config.customPrograms.fish.enable {
    programs.yazi = {
      enable = true;
      enableFishIntegration = config.customPrograms.fish.enable;
    };

    xdg.configFile."yazi/init.lua".text = ''
      require("zoxide"):setup {
        update_db = true,
      }
    '';
  };
}
