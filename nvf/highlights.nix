{
  config.vim = {
    highlight = {
      CursorLineNr.link = "Normal";
      LineNr.link = "Whitespace";
    };

    luaConfigRC.replace-highlights = ''
      vim.api.nvim_set_hl(0, 'FoldColumn', vim.tbl_extend('force', vim.api.nvim_get_hl(0, { name = 'FoldColumn' }), { bg = 'NONE' }))
      vim.api.nvim_set_hl(0, 'SignColumn', vim.tbl_extend('force', vim.api.nvim_get_hl(0, { name = 'SignColumn' }), { bg = 'NONE' }))
    '';
  };
}
