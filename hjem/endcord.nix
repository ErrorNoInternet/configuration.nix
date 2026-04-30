{ lib, osConfig, ... }:
{
  xdg.data.files = lib.mkIf osConfig.graphical.enable {
    "endcord/config.ini".text =
      with lib;
      generators.toINI
        {
          mkKeyValue = generators.mkKeyValueDefault {
            mkValueString =
              v:
              if builtins.isBool v && v then
                "True"
              else if builtins.isBool v && !v then
                "False"
              else if isString v then
                ''"${v}"''
              else
                generators.mkValueStringDefault { } v;
          } "=";
        }
        {
          main = {
            downloads_path = "~/downloads";
            send_typing = false;
            vim_mode = true;
          };
        };
  };
}
