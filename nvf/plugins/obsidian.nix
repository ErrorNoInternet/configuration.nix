{
  config.vim = {
    notes.obsidian = {
      enable = true;

      setupOpts = {
        legacy_commands = false;

        workspaces = [
          {
            name = "devnull";
            path = "~/devnull";
          }
          {
            name = "liminal";
            path = "~/liminal";
          }
        ];

        frontmatter.enabled = false;
      };
    };

    keymaps = [
      {
        action = "<Cmd>Obsidian quick_switch<CR>";
        key = "<Leader>o";
        mode = [
          "n"
          "v"
        ];
      }
      {
        action = "<Cmd>Obsidian<CR>";
        key = "<Leader>O";
        mode = [
          "n"
          "v"
        ];
      }
    ];
  };
}
