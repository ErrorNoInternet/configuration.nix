builtins.toJSON {
  general.processingTimeout = 10000;
  logo = {
    source = "nixos_old_small";
    padding = {
      left = 1;
      right = 3;
    };
  };
  display = {
    separator = " ";
    keyWidth = 14;
  };
  modules = let
    getprop = "/android/system/bin/linker64 /android/system/bin/getprop";
  in [
    {
      type = "command";
      key = " system  ";
      text = "echo \"Android $(${getprop} ro.build.version.release) (API $(${getprop} ro.build.version.sdk))\"";
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
