{ lib, ... }:
let
  inherit (lib.generators) mkLuaInline;
in
{
  config.vim = {
    filetree.nvimTree = {
      enable = true;

      openOnSetup = false;

      setupOpts = {
        disable_netrw = true;

        diagnostics = {
          enable = true;
          show_on_dirs = true;
        };

        view = {
          width = 32;
          signcolumn = "no";
        };
      };

      mappings = {
        toggle = "tt";
      };
    };

    autocmds = [
      {
        event = [ "VimEnter" ];
        callback = mkLuaInline /* lua */ ''
          function(data)
            local directory = vim.fn.isdirectory(data.file) == 1
            if not directory then
              return
            end
            vim.cmd.cd(data.file)
            require("nvim-tree.api").tree.open()
          end
        '';
      }
      {
        event = [
          "BufEnter"
          "QuitPre"
        ];
        callback = mkLuaInline /* lua */ ''
          function(e)
            local tree = require("nvim-tree.api").tree

            if not tree.is_visible() then
              return
            end

            local winCount = 0
            for _, winId in ipairs(vim.api.nvim_list_wins()) do
              if vim.api.nvim_win_get_config(winId).focusable then
                winCount = winCount + 1
              end
            end

            if e.event == "QuitPre" and winCount == 2 then
              vim.api.nvim_cmd({ cmd = "qall" }, {})
            end

            if e.event == "BufEnter" and winCount == 1 then
              vim.defer_fn(function()
                tree.toggle({ find_file = true, focus = true })
                tree.toggle({ find_file = true, focus = false })
              end, 10)
            end
          end
        '';
      }
    ];
  };
}
