{
  config.vim = {
    formatter.conform-nvim = {
      enable = true;

      setupOpts.formatters_by_ft = {
        nix = [ "nixfmt" ];
        python = [
          "ruff_format"
          "ruff_organize_imports"
        ];
      };
    };

    keymaps = [
      {
        action = "<Esc><Cmd>lua require('conform').format()<CR>:w<CR>";
        key = "<F2>";
        mode = [
          "i"
          "n"
          "v"
        ];
      }
      {
        action = "<Esc><Cmd>lua require('conform').format()<CR>";
        key = "<F3>";
        mode = [
          "i"
          "n"
          "v"
        ];
      }
    ];
  };
}
