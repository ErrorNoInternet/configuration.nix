{ pkgs, ... }:
{
  config.vim = {
    telescope = {
      enable = true;

      extensions = [
        { name = "yank_history"; }
      ];
    };

    extraPlugins.telescope-ui-select = {
      package = pkgs.vimPlugins.telescope-ui-select-nvim;
      setup = "require('telescope').load_extension('ui-select')";
    };
  };
}
