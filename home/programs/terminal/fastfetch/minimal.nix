builtins.toJSON {
  general.processingTimeout = 10000;
  logo = {
    source = "nixos_small";
    padding = {
      left = 1;
      right = 3;
    };
  };
  display = {
    separator = " ";
    keyWidth = 14;
  };
  modules = [
    {
      type = "os";
      key = " system  ";
      format = "{3}";
    }
    {
      type = "kernel";
      key = " kernel  ";
      format = "{1} {2} ({4})";
    }
    {
      type = "uptime";
      key = " uptime  ";
    }
    {
      type = "packages";
      key = "󰆧 packages";
    }
    {
      type = "memory";
      key = "󰍛 memory  ";
    }
    {
      type = "disk";
      key = "󱥎 storage ";
      format = "{1} / {2} ({3})";
      folders = "/";
    }
    {
      type = "custom";
      format = "\\u001B[37m     \\u001B[36m     \\u001B[35m     \\u001B[34m     \\u001B[33m     \\u001B[32m     \\u001B[31m     \\u001B[30m";
    }
  ];
}
