{ pkgs, ... }:
{
  config.vim = {
    autocomplete.blink-cmp = {
      enable = true;

      friendly-snippets.enable = true;

      sourcePlugins = {
        nerdfont = {
          enable = true;
          package = pkgs.vimPlugins.blink-nerdfont-nvim;
          module = "blink-nerdfont";
        };

        yank = {
          enable = true;
          package = pkgs.vimPlugins.blink-cmp-yanky;
          module = "blink-yanky";
        };
      };

      setupOpts = {
        sources.default = [
          "nerdfont"
          "yank"
        ];

        cmdline = {
          sources = [
            "buffer"
            "cmdline"
            "path"
          ];

          completion.list.selection.preselect = false;
        };

        completion.list.selection.preselect = false;
      };
    };
  };
}
