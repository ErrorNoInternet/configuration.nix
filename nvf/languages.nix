{
  config.vim.languages = {
    enableFormat = true;
    enableTreesitter = true;
    enableExtraDiagnostics = true;

    assembly.enable = true;

    bash.enable = true;

    clang.enable = true;

    css.enable = true;

    go.enable = true;

    html.enable = true;

    json.enable = true;

    lua = {
      enable = true;
      lsp.lazydev.enable = true;
    };

    markdown = {
      enable = true;
      extensions.render-markdown-nvim = {
        enable = true;

        setupOpts.code = {
          border = "thin";
          conceal_delimiters = false;
          sign = false;
        };
      };
    };

    nix.enable = true;

    python.enable = true;

    rust = {
      enable = true;
      extensions.crates-nvim.enable = true;
    };

    yaml.enable = true;

    zig.enable = true;
  };
}
