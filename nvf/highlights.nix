{
  config.vim = {
    highlight = {
      CursorLineNr.link = "Normal";
      LineNr.link = "Whitespace";
    };

    luaConfigRC.replace-highlights = /* lua */ ''
      vim.api.nvim_set_hl(0, 'FoldColumn', { bg = 'NONE', update = true })
      vim.api.nvim_set_hl(0, 'SignColumn', { bg = 'NONE', update = true })
    '';
  };
}
