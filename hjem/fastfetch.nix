{
  xdg.config.files = {
    "fastfetch/config.jsonc".text = builtins.toJSON {
      general.processingTimeout = 10000;
      modules = [
        "title"
        "separator"
        "os"
        "kernel"
        "uptime"
        "packages"
        "shell"
        "display"
        "wm"
        "theme"
        "icons"
        "font"
        "cursor"
        "terminal"
        "processes"
        "memory"
        {
          folders = "/";
          type = "disk";
        }
        "break"
        "colors"
      ];
    };

    "fastfetch/minimal.jsonc".text = builtins.toJSON {
      display = {
        key.width = 14;
        separator = " ";
      };
      general.processingTimeout = 10000;
      logo = {
        padding = {
          left = 1;
          right = 3;
        };
        source = "NixOS_small";
      };
      modules = [
        {
          format = "{3}";
          key = " system  ";
          type = "os";
        }
        {
          format = "{2}";
          key = " kernel  ";
          type = "kernel";
        }
        {
          key = " uptime  ";
          type = "uptime";
        }
        {
          key = "󰆧 packages";
          type = "packages";
        }
        {
          format = "{3} {4} (/dev/pts/{8})";
          key = " shell   ";
          type = "shell";
        }
        {
          key = "󰍛 memory  ";
          type = "memory";
        }
        {
          key = "󰓡 swap    ";
          type = "swap";
        }
        {
          folders = "/";
          format = "{1} / {2} ({3})";
          key = "󰆼 storage ";
          type = "disk";
        }
        {
          format = "\\u001B[37m     \\u001B[36m     \\u001B[35m     \\u001B[34m     \\u001B[33m     \\u001B[32m     \\u001B[31m     \\u001B[30m";
          type = "custom";
        }
      ];
    };
  };
}
