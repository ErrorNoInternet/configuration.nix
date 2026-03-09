{
  config,
  lib,
  pkgs,
  self,
  ...
}:
{
  imports = [
    ./keymap.nix
  ];

  programs.yazi = {
    enable = true;

    plugins = with pkgs; {
      bookmarks = self.pins."bookmarks.yazi";
      inherit (yaziPlugins) chmod;
      inherit (yaziPlugins) diff;
      inherit (yaziPlugins) git;
      inherit (yaziPlugins) jump-to-char;
      inherit (yaziPlugins) mount;
      inherit (yaziPlugins) smart-enter;
      inherit (yaziPlugins) sudo;
      inherit (yaziPlugins) toggle-pane;
    };

    flavors.kanagawa = self.pins."kanagawa.yazi";

    initLua = pkgs.writeText "init.lua" ''
      require("zoxide"):setup({ update_db = true })
      require("git"):setup()
    '';

    settings = {
      yazi = {
        mgr = {
          ratio = [
            1
            4
            3
          ];
          sort_by = "natural";
          scrolloff = 5;
        };
      };

      theme = {
        mgr.border_symbol = " ";
      }
      // lib.optionalAttrs (config.scheme.slug == "kanagawa") {
        flavor.dark = "kanagawa";
      };
    };
  };
}
