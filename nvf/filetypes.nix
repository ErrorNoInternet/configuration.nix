{ lib, ... }:
let
  inherit (lib.nvim.lua) toLuaObject;
in
{
  config.vim = {
    luaConfigRC.filetype =
      let
        filetypes = {
          ".*/.irssi/config" = "conf";
          ".*/hypr/.*.conf" = "hyprlang";
        };
      in
      ''
        vim.filetype.add(${toLuaObject filetypes})
      '';

    autocmds = [
      {
        event = [ "FileType" ];
        pattern = [ "nix" ];
        command = "setlocal shiftwidth=2 tabstop=2 softtabstop=2 expandtab";
      }
      {
        event = [ "FileType" ];
        pattern = [ "toml" ];
        command = "setlocal shiftwidth=2 tabstop=2 softtabstop=2 expandtab";
      }
    ];
  };
}
