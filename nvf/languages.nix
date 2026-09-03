{ pkgs, ... }:
{
  config.vim = {
    extraPackages = with pkgs; [
      graphviz
      python3Packages.pylatexenc
    ];

    languages = {
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
        extensions.lazydev.enable = true;
      };

      markdown = {
        enable = true;
        extensions.render-markdown-nvim = {
          enable = true;

          setupOpts = {
            code = {
              border = "thin";
              conceal_delimiters = false;
              sign = false;
            };

            latex.enabled = true;
          };
        };
      };

      nix.enable = true;

      python.enable = true;

      qml.enable = true;

      rust = {
        enable = true;
        lsp.enable = false;
        extensions = {
          crates-nvim.enable = true;
          rustaceanvim.enable = true;
        };
      };

      tex.enable = true;

      toml.enable = true;

      yaml.enable = true;

      zig.enable = true;
    };

    lsp.servers = {
      basedpyright.settings.basedpyright.analysis.typeCheckingMode = "standard";
      nil.settings.nil.nix.flake.autoArchive = true;
    };
  };
}
