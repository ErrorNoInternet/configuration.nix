{ lib, pkgs, ... }:
let
  inherit (lib.nvim.dag) entryBefore;
in
{
  config.vim = {
    startPlugins = [ pkgs.vimPlugins.kanagawa-nvim ];

    luaConfigRC.theme = entryBefore [ "pluginConfigs" "lazyConfigs" ] ''
      vim.cmd.colorscheme("kanagawa")
    '';

    luaConfigRC.fix-highlights = ''
      vim.api.nvim_set_hl(0, 'GitSignsAdd', vim.tbl_extend('force', vim.api.nvim_get_hl(0, { name = 'GitSignsAdd' }), { bg = 'NONE' }))
      vim.api.nvim_set_hl(0, 'GitSignsChange', vim.tbl_extend('force', vim.api.nvim_get_hl(0, { name = 'GitSignsChange' }), { bg = 'NONE' }))
      vim.api.nvim_set_hl(0, 'GitSignsDelete', vim.tbl_extend('force', vim.api.nvim_get_hl(0, { name = 'GitSignsDelete' }), { bg = 'NONE' }))
    '';
  };
}
