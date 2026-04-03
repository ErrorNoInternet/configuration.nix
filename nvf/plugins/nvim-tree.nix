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
    ];
  };
}
