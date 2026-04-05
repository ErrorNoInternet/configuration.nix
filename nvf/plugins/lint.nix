{ pkgs, ... }:
{
  config.vim = {
    extraPackages = with pkgs; [
      markdownlint-cli2
      ruff
      yamllint
      zig-zlint
    ];

    diagnostics.nvim-lint = {
      enable = true;

      linters_by_ft = {
        fish = [ "fish" ];
        markdown = [ "markdownlint-cli2" ];
        python = [ "ruff" ];
        yaml = [ "yamllint" ];
        zig = [ "zlint" ];
      };

      linters = {
        markdownlint-cli2.args =
          let
            opts.config = {
              MD007.indent = 4;
              MD010 = false;
              MD041 = false;
            };
          in
          [
            "--config"
            "${pkgs.writeText "nvf.markdownlint-cli2.jsonc" (builtins.toJSON opts)}"
          ];

        yamllint.args = [
          "-d"
          "relaxed"
          "--format"
          "parsable"
          "-"
        ];
      };
    };

    keymaps = [
      {
        action = "<Esc><Cmd>lua require('lint').try_lint()<CR>";
        key = "<F4>";
        mode = [
          "i"
          "n"
          "v"
        ];
      }
    ];
  };
}
