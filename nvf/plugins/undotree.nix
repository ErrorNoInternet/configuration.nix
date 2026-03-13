{
  config.vim = {
    utility.undotree.enable = true;

    globals.undotree_HelpLine = 0;

    keymaps = [
      {
        action = "<Cmd>UndotreeToggle<CR>";
        key = "<Leader>u";
        mode = [
          "n"
          "v"
        ];
      }
    ];
  };
}
