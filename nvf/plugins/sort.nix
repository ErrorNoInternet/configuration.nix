{ lib, pkgs, ... }:
let
  inherit (lib.nvim.lua) toLuaObject;
in
{
  config.vim.extraPlugins.sort-motion = {
    package = pkgs.vimPlugins.sort-nvim;
    setup =
      let
        opts.ignore_case = true;
      in
      "require('sort').setup(${toLuaObject opts})";
  };
}
