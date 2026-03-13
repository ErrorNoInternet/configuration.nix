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

      componentSeparator = {
        left = "|";
        right = "|";
      };
      sectionSeparator = { inherit (separators) left right; };
      activeSection = {
        a = [ ''"mode"'' ];
        b = [ ''"filetype", "filename"'' ];
        c = [ ''"navic"'' ];
        x = [ ''"diagnostics"'' ];
        y = [ ''"searchcount", "branch"'' ];
        z = [ ''"progress", "location", "fileformat"'' ];
      };
    };
}
