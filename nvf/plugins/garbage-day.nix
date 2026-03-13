{
  lib,
  pins,
  pkgs,
  ...
}:
let
  inherit (lib.nvim.lua) toLuaObject;
in
{
  config.vim.extraPlugins.garbage-day = {
    package = pkgs.vimUtils.buildVimPlugin {
      name = "garbage-day-nvim";
      src = pins."garbage-day.nvim";
    };

    setup =
      let
        opts = {
          grace_period = 60 * 60;
          wakeup_delay = 3000;
        };
      in
      "require('garbage-day').setup(${toLuaObject opts})";
  };
}
