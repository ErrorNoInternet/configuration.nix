{
  programs.yazi.settings.keymap.mgr.prepend_keymap = [
    {
      on = "l";
      run = "plugin smart-enter";
      desc = "enter the child directory";
    }
    {
      on = "<Right>";
      run = "plugin smart-enter";
      desc = "enter the child directory";
    }
    {
      on = "<C-t>";
      run = "plugin toggle-pane min-preview";
      desc = "maximize or restore preview";
    }
    {
      on = "`";
      run = "plugin bookmarks jump";
      desc = "jump to marked location";
    }
    {
      on = "f";
      run = "plugin jump-to-char";
      desc = "jump to char";
    }
    {
      on = "M";
      run = "plugin bookmarks save";
      desc = "mark current location";
    }
    {
      on = "T";
      run = "plugin toggle-pane max-preview";
      desc = "maximize or restore preview";
    }
    {
      on = "<A-m>";
      run = "plugin mount";
      desc = "manage system mountpoints";
    }
    {
      on = "<C-e>";
      run = "plugin diff";
      desc = "diff the selected with the hovered file";
    }
    {
      on = [
        "b"
        "d"
      ];
      run = "plugin bookmarks delete";
      desc = "delete a marked location";
    }
    {
      on = [
        "b"
        "D"
      ];
      run = "plugin bookmarks delete_all";
      desc = "delete all marked locations";
    }
    {
      on = [
        "c"
        "m"
      ];
      run = "plugin chmod";
      desc = "run chmod on selected files";
    }
    {
      on = [
        "R"
        "p"
        "p"
      ];
      run = "plugin sudo -- paste";
      desc = "sudo paste";
    }
    {
      on = [
        "R"
        "P"
      ];
      run = "plugin sudo -- paste --force";
      desc = "sudo paste";
    }
    {
      on = [
        "R"
        "r"
      ];
      run = "plugin sudo -- rename";
      desc = "sudo rename";
    }
    {
      on = [
        "R"
        "p"
        "l"
      ];
      run = "plugin sudo -- link";
      desc = "sudo link";
    }
    {
      on = [
        "R"
        "p"
        "r"
      ];
      run = "plugin sudo -- link --relative";
      desc = "sudo link relative path";
    }
    {
      on = [
        "R"
        "p"
        "L"
      ];
      run = "plugin sudo -- hardlink";
      desc = "sudo hardlink";
    }
    {
      on = [
        "R"
        "a"
      ];
      run = "plugin sudo -- create";
      desc = "sudo create";
    }
    {
      on = [
        "R"
        "d"
      ];
      run = "plugin sudo -- remove";
      desc = "sudo trash";
    }
    {
      on = [
        "R"
        "D"
      ];
      run = "plugin sudo -- remove --permanently";
      desc = "sudo delete";
    }
    {
      on = [
        "R"
        "m"
      ];
      run = "plugin sudo -- chmod";
      desc = "sudo chmod";
    }
  ];
}
