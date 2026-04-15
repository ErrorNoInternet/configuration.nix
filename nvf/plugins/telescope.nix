{ pkgs, ... }:
{
  config.vim = {
    telescope = {
      enable = true;

      extensions = [
        { name = "yank_history"; }
      ];

      setupOpts.defaults.file_ignore_patterns = [ ];
    };

    extraPlugins.telescope-ui-select = {
      package = pkgs.vimPlugins.telescope-ui-select-nvim;
      setup = "require('telescope').load_extension('ui-select')";
    };
  };
}
