{ lib, ... }:
let
  inherit (lib.nvim.lua) toLuaObject;
in
{
  config.vim.extraPlugins.navic = {
    package = "nvim-navic";

    setup =
      let
        opts.lsp = {
          auto_attach = true;
          preference = [
            "marksman"
            "obsidian-ls"
          ];
        };
      in
      "require('nvim-navic').setup(${toLuaObject opts})";
  };
}
