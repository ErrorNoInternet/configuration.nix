{
  programs.yazi.settings.keymap = {
    mgr = {
      keymap = [
        {
          on = "<Esc>";
          run = "escape";
          desc = "exit visual mode, clear selected, or cancel search";
        }
        {
          on = "<C-[>";
          run = "escape";
          desc = "exit visual mode, clear selected, or cancel search";
        }
        {
          on = "q";
          run = "quit";
          desc = "exit the process";
        }
        {
          on = "Q";
          run = "quit --no-cwd-file";
          desc = "exit the process without writing cwd-file";
        }
        {
          on = "<C-c>";
          run = "close";
          desc = "close the current tab, or quit if it is last tab";
        }
        {
          on = "<C-z>";
          run = "suspend";
          desc = "suspend the process";
        }

        {
          on = "k";
          run = "arrow -1";
          desc = "move cursor up";
        }
        {
          on = "j";
          run = "arrow 1";
          desc = "move cursor down";
        }
        {
          on = "<Up>";
          run = "arrow -1";
          desc = "move cursor up";
        }
        {
          on = "<Down>";
          run = "arrow 1";
          desc = "move cursor down";
        }
        {
          on = "<S-Up>";
          run = "arrow -5";
          desc = "move cursor up x5";
        }
        {
          on = "<S-Down>";
          run = "arrow 5";
          desc = "move cursor down x5";
        }
        {
          on = "<C-u>";
          run = "arrow -50%";
          desc = "move cursor up half page";
        }
        {
          on = "<C-d>";
          run = "arrow 50%";
          desc = "move cursor down half page";
        }
        {
          on = "<C-b>";
          run = "arrow -100%";
          desc = "move cursor up one page";
        }
        {
          on = "<C-f>";
          run = "arrow 100%";
          desc = "move cursor down one page";
        }
        {
          on = "<S-PageUp>";
          run = "arrow -50%";
          desc = "move cursor up half page";
        }
        {
          on = "<S-PageDown>";
          run = "arrow 50%";
          desc = "move cursor down half page";
        }
        {
          on = "<PageUp>";
          run = "arrow -100%";
          desc = "move cursor up one page";
        }
        {
          on = "<PageDown>";
          run = "arrow 100%";
          desc = "move cursor down one page";
        }
        {
          on = [
            "g"
            "g"
          ];
          run = "arrow top";
          desc = "move cursor to the top";
        }
        {
          on = "G";
          run = "arrow bot";
          desc = "move cursor to the bottom";
        }

        {
          on = "h";
          run = "leave";
          desc = "go back to the parent directory";
        }
        {
          on = "l";
          run = "plugin smart-enter";
          desc = "enter the child directory";
        }
        {
          on = "<Left>";
          run = "leave";
          desc = "go back to the parent directory";
        }
        {
          on = "<Right>";
          run = "plugin smart-enter";
          desc = "enter the child directory";
        }
        {
          on = "H";
          run = "back";
          desc = "go back to the previous directory";
        }
        {
          on = "L";
          run = "forward";
          desc = "go forward to the next directory";
        }
        {
          on = "K";
          run = "seek -5";
          desc = "seek up 5 units in the preview";
        }
        {
          on = "J";
          run = "seek 5";
          desc = "seek down 5 units in the preview";
        }

        {
          on = "<Space>";
          run = [
            "toggle"
            "arrow 1"
          ];
          desc = "toggle the current selection state";
        }
        {
          on = "v";
          run = "visual_mode";
          desc = "enter visual mode (selection mode)";
        }
        {
          on = "V";
          run = "visual_mode --unset";
          desc = "enter visual mode (unset mode)";
        }
        {
          on = "<C-a>";
          run = "toggle_all --state=on";
          desc = "select all files";
        }
        {
          on = "<C-r>";
          run = "toggle_all";
          desc = "inverse selection of all files";
        }

        {
          on = "<Tab>";
          run = "spot";
          desc = "Spot hovered file";
        }
        {
          on = "o";
          run = "open";
          desc = "open selected files";
        }
        {
          on = "e";
          run = ''shell --block "''${"EDITOR:=vi"} \"$@\""'';
          desc = "edit selected files";
        }
        {
          on = "O";
          run = "open --interactive";
          desc = "open selected files interactively";
        }
        {
          on = "<Enter>";
          run = "open";
          desc = "open selected files";
        }
        {
          on = "<S-Enter>";
          run = "open --interactive";
          desc = "open selected files interactively";
        }
        {
          on = "y";
          run = "yank";
          desc = "yank selected files (copy)";
        }
        {
          on = "x";
          run = "yank --cut";
          desc = "yank selected files (cut)";
        }
        {
          on = "p";
          run = "paste";
          desc = "paste yanked files";
        }
        {
          on = "P";
          run = "paste --force";
          desc = "paste yanked files (overwrite if the destination exists)";
        }
        {
          on = "-";
          run = "link";
          desc = "symlink the absolute path of yanked files";
        }
        {
          on = "_";
          run = "link --relative";
          desc = "symlink the relative path of yanked files";
        }
        {
          on = "Y";
          run = "unyank";
          desc = "cancel the yank status";
        }
        {
          on = "X";
          run = "unyank";
          desc = "cancel the yank status";
        }
        {
          on = "D";
          run = "remove";
          desc = "trash selected files";
        }
        {
          on = "d";
          run = "remove --permanently";
          desc = "permanently delete selected files";
        }
        {
          on = "a";
          run = "create";
          desc = "create a file (ends with / for directories)";
        }
        {
          on = "A";
          run = "create --dir";
          desc = "create a directory";
        }
        {
          on = "r";
          run = "rename --cursor=before_ext";
          desc = "rename selected file(s)";
        }
        {
          on = ";";
          run = "shell --interactive";
          desc = "run a shell command";
        }
        {
          on = ":";
          run = "shell --block --interactive";
          desc = "run a shell command (block until finishes)";
        }
        {
          on = ".";
          run = "hidden toggle";
          desc = "toggle the visibility of hidden files";
        }

        {
          on = [
            "m"
            "s"
          ];
          run = "linemode size";
          desc = "set linemode to size";
        }
        {
          on = [
            "m"
            "p"
          ];
          run = "linemode permissions";
          desc = "set linemode to permissions";
        }
        {
          on = [
            "m"
            "b"
          ];
          run = "linemode btime";
          desc = "set linemode to ctime";
        }
        {
          on = [
            "m"
            "m"
          ];
          run = "linemode mtime";
          desc = "set linemode to mtime";
        }
        {
          on = [
            "m"
            "o"
          ];
          run = "linemode owner";
          desc = "set linemode to owner";
        }
        {
          on = [
            "m"
            "n"
          ];
          run = "linemode none";
          desc = "set linemode to none";
        }

        {
          on = [
            "c"
            "c"
          ];
          run = "copy path";
          desc = "copy the file path";
        }
        {
          on = [
            "c"
            "d"
          ];
          run = "copy dirname";
          desc = "copy the directory path";
        }
        {
          on = [
            "c"
            "f"
          ];
          run = "copy filename";
          desc = "copy the filename";
        }
        {
          on = [
            "c"
            "n"
          ];
          run = "copy name_without_ext";
          desc = "copy the filename without extension";
        }

        {
          on = "F";
          run = "filter --smart";
          desc = "filter files";
        }
        {
          on = "/";
          run = "find --smart";
          desc = "find next file";
        }
        {
          on = "?";
          run = "find --previous --smart";
          desc = "find previous file";
        }
        {
          on = "n";
          run = "find_arrow";
          desc = "go to the next found";
        }
        {
          on = "N";
          run = "find_arrow --previous";
          desc = "go to the previous found";
        }
        {
          on = "s";
          run = "search fd";
          desc = "search files by name using fd";
        }
        {
          on = "S";
          run = "search rg";
          desc = "search files by content using ripgrep";
        }
        {
          on = "<C-s>";
          run = "search none";
          desc = "cancel the ongoing search";
        }
        {
          on = "z";
          run = "plugin zoxide";
          desc = "jump to a directory using zoxide";
        }
        {
          on = "Z";
          run = "plugin fzf";
          desc = "jump to a directory or reveal a file using fzf";
        }

        {
          on = [
            ","
            "m"
          ];
          run = [
            "sort mtime --reverse=no"
            "linemode mtime"
          ];
          desc = "sort by modified time";
        }
        {
          on = [
            ","
            "M"
          ];
          run = [
            "sort mtime --reverse"
            "linemode mtime"
          ];
          desc = "sort by modified time (reverse)";
        }
        {
          on = [
            ","
            "b"
          ];
          run = [
            "sort btime --reverse=no"
            "linemode btime"
          ];
          desc = "sort by created time";
        }
        {
          on = [
            ","
            "B"
          ];
          run = [
            "sort btime --reverse"
            "linemode btime"
          ];
          desc = "sort by created time (reverse)";
        }
        {
          on = [
            ","
            "e"
          ];
          run = "sort extension --reverse=no";
          desc = "sort by extension";
        }
        {
          on = [
            ","
            "E"
          ];
          run = "sort extension --reverse";
          desc = "sort by extension (reverse)";
        }
        {
          on = [
            ","
            "a"
          ];
          run = "sort alphabetical --reverse=no";
          desc = "sort alphabetically";
        }
        {
          on = [
            ","
            "A"
          ];
          run = "sort alphabetical --reverse";
          desc = "sort alphabetically (reverse)";
        }
        {
          on = [
            ","
            "n"
          ];
          run = "sort natural --reverse=no";
          desc = "sort naturally";
        }
        {
          on = [
            ","
            "N"
          ];
          run = "sort natural --reverse";
          desc = "sort naturally (reverse)";
        }
        {
          on = [
            ","
            "s"
          ];
          run = [
            "sort size --reverse=no"
            "linemode size"
          ];
          desc = "sort by size";
        }
        {
          on = [
            ","
            "S"
          ];
          run = [
            "sort size --reverse"
            "linemode size"
          ];
          desc = "sort by size (reverse)";
        }
        {
          on = [
            ","
            "r"
          ];
          run = "sort random --reverse=no";
          desc = "sort randomly";
        }

        {
          on = "t";
          run = "tab_create --current";
          desc = "create a new tab using the current path";
        }
        {
          on = "1";
          run = "tab_switch 0";
          desc = "switch to the first tab";
        }
        {
          on = "2";
          run = "tab_switch 1";
          desc = "switch to the second tab";
        }
        {
          on = "3";
          run = "tab_switch 2";
          desc = "switch to the third tab";
        }
        {
          on = "4";
          run = "tab_switch 3";
          desc = "switch to the fourth tab";
        }
        {
          on = "5";
          run = "tab_switch 4";
          desc = "switch to the fifth tab";
        }
        {
          on = "6";
          run = "tab_switch 5";
          desc = "switch to the sixth tab";
        }
        {
          on = "7";
          run = "tab_switch 6";
          desc = "switch to the seventh tab";
        }
        {
          on = "8";
          run = "tab_switch 7";
          desc = "switch to the eighth tab";
        }
        {
          on = "9";
          run = "tab_switch 8";
          desc = "switch to the ninth tab";
        }
        {
          on = "[";
          run = "tab_switch -1 --relative";
          desc = "switch to the previous tab";
        }
        {
          on = "]";
          run = "tab_switch 1 --relative";
          desc = "switch to the next tab";
        }
        {
          on = "{";
          run = "tab_swap -1";
          desc = "swap the current tab with the previous tab";
        }
        {
          on = "}";
          run = "tab_swap 1";
          desc = "swap the current tab with the next tab";
        }

        {
          on = [
            "g"
            "d"
          ];
          run = "cd ~/downloads";
          desc = "downloads";
        }
        {
          on = [
            "g"
            "f"
          ];
          run = "follow";
          desc = "follow hovered symlink";
        }
        {
          on = [
            "g"
            "h"
          ];
          run = "cd ~";
          desc = "home";
        }
        {
          on = [
            "g"
            "m"
          ];
          run = "cd /mnt";
          desc = "mnt";
        }
        {
          on = [
            "g"
            "M"
          ];
          run = "cd ~/media";
          desc = "media";
        }
        {
          on = [
            "g"
            "t"
          ];
          run = "cd ~/temporary/testing";
          desc = "testing";
        }
        {
          on = [
            "g"
            "<Space>"
          ];
          run = "cd --interactive";
          desc = "interactive";
        }

        {
          on = [
            "R"
            "R"
          ];
          run = "shell 'ripdrag -xa \"$@\"'";
          desc = "drag files via ripdrag";
        }
        {
          on = "E";
          run = "shell --block 'kdeconnect-cli -d 6ded058eb2e79440 --share \"$@\"; read'";
          desc = "send to KDE Connect device";
        }

        {
          on = "w";
          run = "tasks_show";
          desc = "show task manager";
        }
        {
          on = "~";
          run = "help";
          desc = "open help";
        }
        {
          on = "<F1>";
          run = "help";
          desc = "open help";
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

      prepend_keymap = [
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
      ];
    };

    spot.keymap = [
      {
        on = "<Esc>";
        run = "close";
        desc = "Close the spot";
      }
      {
        on = "<C-[>";
        run = "close";
        desc = "Close the spot";
      }
      {
        on = "<C-c>";
        run = "close";
        desc = "Close the spot";
      }
      {
        on = "<Tab>";
        run = "close";
        desc = "Close the spot";
      }

      {
        on = "k";
        run = "arrow -1";
        desc = "Move cursor up";
      }
      {
        on = "j";
        run = "arrow 1";
        desc = "Move cursor down";
      }
      {
        on = "h";
        run = "swipe -1";
        desc = "Swipe to the next file";
      }
      {
        on = "l";
        run = "swipe 1";
        desc = "Swipe to the previous file";
      }

      {
        on = "<Up>";
        run = "arrow -1";
        desc = "Move cursor up";
      }
      {
        on = "<Down>";
        run = "arrow 1";
        desc = "Move cursor down";
      }
      {
        on = "<Left>";
        run = "swipe -1";
        desc = "Swipe to the next file";
      }
      {
        on = "<Right>";
        run = "swipe 1";
        desc = "Swipe to the previous file";
      }

      {
        on = [
          "c"
          "c"
        ];
        run = "copy cell";
        desc = "Copy selected cell";
      }

      {
        on = "~";
        run = "help";
        desc = "Open help";
      }
      {
        on = "<F1>";
        run = "help";
        desc = "Open help";
      }
    ];

    tasks = {
      keymap = [
        {
          on = "<Esc>";
          run = "close";
          desc = "close task manager";
        }
        {
          on = "<C-[>";
          run = "close";
          desc = "close task manager";
        }
        {
          on = "<C-c>";
          run = "close";
          desc = "close task manager";
        }
        {
          on = "w";
          run = "close";
          desc = "close task manager";
        }

        {
          on = "k";
          run = "arrow -1";
          desc = "move cursor up";
        }
        {
          on = "j";
          run = "arrow 1";
          desc = "move cursor down";
        }

        {
          on = "<Up>";
          run = "arrow -1";
          desc = "move cursor up";
        }
        {
          on = "<Down>";
          run = "arrow 1";
          desc = "move cursor down";
        }

        {
          on = "<Enter>";
          run = "inspect";
          desc = "inspect the task";
        }
        {
          on = "x";
          run = "cancel";
          desc = "cancel the task";
        }

        {
          on = "~";
          run = "help";
          desc = "open help";
        }
        {
          on = "<F1>";
          run = "help";
          desc = "open help";
        }
      ];

      pick.keymap = [
        {
          on = "<Esc>";
          run = "close";
          desc = "cancel selection";
        }
        {
          on = "<C-[>";
          run = "close";
          desc = "cancel selection";
        }
        {
          on = "<C-c>";
          run = "close";
          desc = "cancel selection";
        }
        {
          on = "<Enter>";
          run = "close --submit";
          desc = "submit the selection";
        }

        {
          on = "k";
          run = "arrow -1";
          desc = "move cursor up";
        }
        {
          on = "j";
          run = "arrow 1";
          desc = "move cursor down";
        }

        {
          on = "<Up>";
          run = "arrow -1";
          desc = "move cursor up";
        }
        {
          on = "<Down>";
          run = "arrow 1";
          desc = "move cursor down";
        }
        {
          on = "<S-Up>";
          run = "arrow -5";
          desc = "move cursor up x5";
        }
        {
          on = "<S-Down>";
          run = "arrow 5";
          desc = "move cursor down x5";
        }

        {
          on = "~";
          run = "help";
          desc = "open help";
        }
        {
          on = "<F1>";
          run = "help";
          desc = "open help";
        }
      ];

      input.keymap = [
        {
          on = "<C-c>";
          run = "close";
          desc = "cancel input";
        }
        {
          on = "<Enter>";
          run = "close --submit";
          desc = "submit the input";
        }
        {
          on = "<Esc>";
          run = "escape";
          desc = "go back the normal mode, or cancel input";
        }
        {
          on = "<C-[>";
          run = "escape";
          desc = "go back the normal mode, or cancel input";
        }

        {
          on = "i";
          run = "insert";
          desc = "enter insert mode";
        }
        {
          on = "a";
          run = "insert --append";
          desc = "enter append mode";
        }
        {
          on = "I";
          run = [
            "move -999"
            "insert"
          ];
          desc = "move to the BOL, and enter insert mode";
        }
        {
          on = "A";
          run = [
            "move 999"
            "insert --append"
          ];
          desc = "move to the EOL, and enter append mode";
        }
        {
          on = "v";
          run = "visual";
          desc = "enter visual mode";
        }
        {
          on = "V";
          run = [
            "move -999"
            "visual"
            "move 999"
          ];
          desc = "enter visual mode and select all";
        }

        {
          on = "h";
          run = "move -1";
          desc = "move back a character";
        }
        {
          on = "l";
          run = "move 1";
          desc = "move forward a character";
        }
        {
          on = "<Left>";
          run = "move -1";
          desc = "move back a character";
        }
        {
          on = "<Right>";
          run = "move 1";
          desc = "move forward a character";
        }
        {
          on = "<C-b>";
          run = "move -1";
          desc = "move back a character";
        }
        {
          on = "<C-f>";
          run = "move 1";
          desc = "move forward a character";
        }

        {
          on = "b";
          run = "backward";
          desc = "move back to the start of the current or previous word";
        }
        {
          on = "w";
          run = "forward";
          desc = "move forward to the start of the next word";
        }
        {
          on = "e";
          run = "forward --end-of-word";
          desc = "move forward to the end of the current or next word";
        }
        {
          on = "<A-b>";
          run = "backward";
          desc = "move back to the start of the current or previous word";
        }
        {
          on = "<A-f>";
          run = "forward --end-of-word";
          desc = "move forward to the end of the current or next word";
        }

        {
          on = "0";
          run = "move -999";
          desc = "move to the BOL";
        }
        {
          on = "$";
          run = "move 999";
          desc = "move to the EOL";
        }
        {
          on = "<C-a>";
          run = "move -999";
          desc = "move to the BOL";
        }
        {
          on = "<C-e>";
          run = "move 999";
          desc = "move to the EOL";
        }
        {
          on = "<Home>";
          run = "move -999";
          desc = "move to the BOL";
        }
        {
          on = "<End>";
          run = "move 999";
          desc = "move to the EOL";
        }

        {
          on = "<Backspace>";
          run = "backspace";
          desc = "delete the character before the cursor";
        }
        {
          on = "<Delete>";
          run = "backspace --under";
          desc = "delete the character under the cursor";
        }
        {
          on = "<C-h>";
          run = "backspace";
          desc = "delete the character before the cursor";
        }
        {
          on = "<C-d>";
          run = "backspace --under";
          desc = "delete the character under the cursor";
        }

        {
          on = "<C-u>";
          run = "kill bol";
          desc = "kill backwards to the BOL";
        }
        {
          on = "<C-k>";
          run = "kill eol";
          desc = "kill forwards to the EOL";
        }
        {
          on = "<C-w>";
          run = "kill backward";
          desc = "kill backwards to the start of the current word";
        }
        {
          on = "<A-d>";
          run = "kill forward";
          desc = "kill forwards to the end of the current word";
        }

        {
          on = "d";
          run = "delete --cut";
          desc = "cut the selected characters";
        }
        {
          on = "D";
          run = [
            "delete --cut"
            "move 999"
          ];
          desc = "cut until the EOL";
        }
        {
          on = "c";
          run = "delete --cut --insert";
          desc = "cut the selected characters, and enter insert mode";
        }
        {
          on = "C";
          run = [
            "delete --cut --insert"
            "move 999"
          ];
          desc = "cut until the EOL, and enter insert mode";
        }
        {
          on = "x";
          run = [
            "delete --cut"
            "move 1 --in-operating"
          ];
          desc = "cut the current character";
        }
        {
          on = "y";
          run = "yank";
          desc = "copy the selected characters";
        }
        {
          on = "p";
          run = "paste";
          desc = "paste the copied characters after the cursor";
        }
        {
          on = "P";
          run = "paste --before";
          desc = "paste the copied characters before the cursor";
        }

        {
          on = "u";
          run = "undo";
          desc = "undo the last operation";
        }
        {
          on = "<C-r>";
          run = "redo";
          desc = "redo the last operation";
        }

        {
          on = "~";
          run = "help";
          desc = "open help";
        }
        {
          on = "<F1>";
          run = "help";
          desc = "open help";
        }
      ];

      cmp.keymap = [
        {
          on = "<C-c>";
          run = "close";
          desc = "cancel completion";
        }
        {
          on = "<Tab>";
          run = "close --submit";
          desc = "submit the completion";
        }
        {
          on = "<Enter>";
          run = [
            "close --submit"
            "close_input --submit"
          ];
          desc = "submit the completion and input";
        }

        {
          on = "<A-k>";
          run = "arrow -1";
          desc = "move cursor up";
        }
        {
          on = "<A-j>";
          run = "arrow 1";
          desc = "move cursor down";
        }

        {
          on = "<Up>";
          run = "arrow -1";
          desc = "move cursor up";
        }
        {
          on = "<Down>";
          run = "arrow 1";
          desc = "move cursor down";
        }

        {
          on = "<C-p>";
          run = "arrow -1";
          desc = "move cursor up";
        }
        {
          on = "<C-n>";
          run = "arrow 1";
          desc = "move cursor down";
        }

        {
          on = "~";
          run = "help";
          desc = "open help";
        }
        {
          on = "<F1>";
          run = "help";
          desc = "open help";
        }
      ];

      help.keymap = [
        {
          on = "<Esc>";
          run = "escape";
          desc = "clear the filter, or hide the help";
        }
        {
          on = "<C-[>";
          run = "escape";
          desc = "clear the filter, or hide the help";
        }
        {
          on = "q";
          run = "close";
          desc = "exit the process";
        }
        {
          on = "<C-c>";
          run = "close";
          desc = "hide the help";
        }

        {
          on = "k";
          run = "arrow -1";
          desc = "move cursor up";
        }
        {
          on = "j";
          run = "arrow 1";
          desc = "move cursor down";
        }

        {
          on = "<Up>";
          run = "arrow -1";
          desc = "move cursor up";
        }
        {
          on = "<Down>";
          run = "arrow 1";
          desc = "move cursor down";
        }
        {
          on = "<S-Up>";
          run = "arrow -5";
          desc = "move cursor up x5";
        }
        {
          on = "<S-Down>";
          run = "arrow 5";
          desc = "move cursor down x5";
        }

        {
          on = "/";
          run = "filter";
          desc = "apply a filter for the help items";
        }
      ];
    };
  };
}
