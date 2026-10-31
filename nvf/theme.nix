{ lib, ... }:
let
  inherit (lib.nvim.dag) entryAfter;
in
{
  config.vim = {
    theme = {
      enable = true;
      name = "kanagawa";
      style = "wave";
    };

    luaConfigRC.theme-overrides = entryAfter [ "theme" ] /* lua */ ''
      vim.api.nvim_set_hl(0, 'GitSignsAdd', { bg = 'NONE', update = true })
      vim.api.nvim_set_hl(0, 'GitSignsChange', { bg = 'NONE', update = true })
      vim.api.nvim_set_hl(0, 'GitSignsDelete', { bg = 'NONE', update = true })
      vim.api.nvim_set_hl(0, 'GitSignsStagedAdd', { bg = 'NONE', update = true })
      vim.api.nvim_set_hl(0, 'GitSignsStagedChange', { bg = 'NONE', update = true })
      vim.api.nvim_set_hl(0, 'GitSignsStagedDelete', { bg = 'NONE', update = true })
    '';
  };
}
