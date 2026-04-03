{ lib, pkgs, ... }:
let
  inherit (lib.nvim.dag) entryBefore;
in
{
  config.vim = {
    startPlugins = [ pkgs.vimPlugins.kanagawa-nvim ];

    luaConfigRC.theme = entryBefore [ "pluginConfigs" "lazyConfigs" ] /* lua */ ''
      vim.cmd.colorscheme("kanagawa")
    '';

    luaConfigRC.fix-highlights = /* lua */ ''
      vim.api.nvim_set_hl(0, 'GitSignsAdd', { bg = 'NONE', update = true })
      vim.api.nvim_set_hl(0, 'GitSignsChange', { bg = 'NONE', update = true })
      vim.api.nvim_set_hl(0, 'GitSignsDelete', { bg = 'NONE', update = true })
    '';
  };
}
