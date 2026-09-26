{
  config.vim.statusline.lualine =
    let
      separators = {
        left = "";
        right = "";
      };
    in
    {
      enable = true;

      setupOpts = {
        options = {
          component_separators = {
            left = "|";
            right = "|";
          };
          section_separators = { inherit (separators) left right; };
        };

        sections = {
          lualine_a = [ { "@1" = "mode"; } ];
          lualine_b = [
            { "@1" = "filetype"; }
            { "@1" = "filename"; }
          ];
          lualine_c = [ { "@1" = "navic"; } ];
          lualine_x = [ { "@1" = "diagnostics"; } ];
          lualine_y = [
            { "@1" = "searchcount"; }
            { "@1" = "branch"; }
          ];
          lualine_z = [
            { "@1" = "progress"; }
            { "@1" = "location"; }
            { "@1" = "fileformat"; }
          ];
        };
      };
    };
}
