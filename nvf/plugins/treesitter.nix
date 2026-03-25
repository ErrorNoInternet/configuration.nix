{ pkgs, ... }:
{
  config.vim.treesitter = {
    enable = true;

    context = {
      enable = true;
      setupOpts = {
        max_lines = 3;
        min_window_height = 12;
        separator = null;
      };
    };

    grammars = with pkgs.vimPlugins.nvim-treesitter.builtGrammars; [
      cuda
      fish
      hyprlang
      regex
      toml
    ];
  };
}
