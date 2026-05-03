{ pkgs, ... }:
{
  config.vim = {
    extraPackages = with pkgs; [
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
        lsp.lazydev.enable = true;
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
        extensions.crates-nvim.enable = true;
      };

      tex.enable = true;

      toml.enable = true;

      yaml.enable = true;

      zig.enable = true;
    };

    lsp.servers = {
      basedpyright.settings.basedpyright.analysis.typeCheckingMode = "standard";
    };
  };
}
