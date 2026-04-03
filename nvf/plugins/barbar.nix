{ lib, pkgs, ... }:
let
  inherit (lib.nvim.dag) entryAfter;
  inherit (lib.nvim.lua) toLuaObject;
in
{
  config.vim = {
    extraPlugins.barbar = {
      package = pkgs.vimPlugins.barbar-nvim;

      setup =
        let
          opts.icons = {
            button = false;
            gitsigns = {
              added = {
                enabled = true;
                icon = "+";
              };
              changed = {
                enabled = true;
                icon = "~";
              };
              deleted = {
                enabled = true;
                icon = "-";
              };
            };
          };
        in
        /* lua */ ''
          require("lz.n").trigger_load("nvim-web-devicons")
          require('barbar').setup(${toLuaObject opts})
        '';
    };

    luaConfigRC.barbar = entryAfter [ "pluginConfigs" ] /* lua */ ''
      local lualine_a_normal = vim.api.nvim_get_hl(0, { name = "lualine_a_normal" })
      local lualine_c_normal = vim.api.nvim_get_hl(0, { name = "lualine_c_normal" })

      vim.api.nvim_set_hl(0, "BufferCurrentSign", { bg = lualine_c_normal.bg, fg = lualine_a_normal.bg })
      vim.api.nvim_set_hl(0, "BufferTabpageFill", { link = "BufferInactive" })
    '';

    keymaps = [
      {
        action = "<Cmd>BufferPrevious<CR>";
        key = "<A-,>";
        mode = "n";
      }
      {
        action = "<Cmd>BufferNext<CR>";
        key = "<A-.>";
        mode = "n";
      }
      {
        action = "<Cmd>BufferMovePrevious<CR>";
        key = "<A-<>";
        mode = "n";
      }
      {
        action = "<Cmd>BufferMoveNext<CR>";
        key = "<A->>";
        mode = "n";
      }
      {
        action = "<Cmd>BufferClose<CR>";
        key = "<A-c>";
        mode = "n";
      }
      {
        action = "<Cmd>BufferRestore<CR>";
        key = "<A-s-c>";
        mode = "n";
      }
      {
        action = "<Cmd>BufferPick<CR>";
        key = "<A-p>";
        mode = "n";
      }
      {
        action = "<Cmd>BufferPickDelete<CR>";
        key = "<A-s-p>";
        mode = "n";
      }
      {
        action = "<Cmd>BufferLast<CR>";
        key = "<A-0>";
        mode = "n";
      }
    ]
    ++ builtins.genList (
      i:
      let
        n = builtins.toString (i + 1);
      in
      {
        action = "<Cmd>BufferGoto ${n}<CR>";
        key = "<A-${n}>";
        mode = "n";
      }
    ) 9;
  };
}
