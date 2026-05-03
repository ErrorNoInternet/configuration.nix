{ pkgs, ... }:
{
  config.vim.extraPlugins.indent-object.package = pkgs.vimPlugins.vim-indent-object;
}
