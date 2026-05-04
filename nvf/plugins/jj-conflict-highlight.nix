{ pins, pkgs, ... }:
{
  config.vim.extraPlugins.jj-conflict-highlight = {
    package = pkgs.vimUtils.buildVimPlugin {
      name = "jj-conflict-highlight";
      src = pins."jj-conflict-highlight.nvim";
    };
    setup = "require('jj_conflict_highlight').setup()";
  };
}
