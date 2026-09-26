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
          lualine_a = [ ''"mode"'' ];
          lualine_b = [ ''"filetype", "filename"'' ];
          lualine_c = [ ''"navic"'' ];
          lualine_x = [ ''"diagnostics"'' ];
          lualine_y = [ ''"searchcount", "branch"'' ];
          lualine_z = [ ''"progress", "location", "fileformat"'' ];
        };
      };
    };
}
