{
  osConfig,
  lib,
  ...
}:
let
  inherit (lib)
    concatMapStringsSep
    concatStringsSep
    isString
    mapAttrsToList
    mkIf
    ;

  codes = [
    "base00"
    "base01"
    "base02"
    "base03"
    "base04"
    "base05"
    "base06"
    "base07"
    "base08"
    "base09"
    "base0A"
    "base0B"
    "base0C"
    "base0D"
    "base0E"
    "base0F"
    "base10"
    "base11"
    "base12"
    "base13"
    "base14"
    "base15"
    "base16"
    "base17"

    "blue"
    "cyan"
    "green"
    "magenta"
    "orange"
    "red"
    "yellow"

    "bright-blue"
    "bright-cyan"
    "bright-green"
    "bright-magenta"
    "bright-red"
    "bright-yellow"
  ];

  colors = concatStringsSep "\n" (
    mapAttrsToList (code: value: "    [\"${code}\"] = \"rgb(${toString value})\",") (
      lib.genAttrs codes (code: osConfig.scheme.${code})
    )
  );

  luaValue = v: if isString v then ''"${v}"'' else toString v;

  monitors = concatMapStringsSep "\n" (
    monitor:
    let
      fields = [
        "output = ${luaValue monitor.output}"
        "mode = ${luaValue monitor.mode}"
        "position = ${luaValue monitor.position}"
        "scale = ${luaValue monitor.scale}"
      ]
      ++ mapAttrsToList (key: value: "${key} = ${luaValue value}") monitor.extra;
    in
    "hl.monitor({ ${concatStringsSep ", " fields} })"
  ) osConfig.hyprland.monitors;
in
{
  rum.desktops.hyprland.enable = osConfig.hyprland.enable;

  xdg.config.files = mkIf osConfig.hyprland.enable {
    "hypr/hyprland.lua".source = ./hyprland.lua;
    "hypr/aesthetics.lua".source = ./aesthetics.lua;
    "hypr/binds.lua".source = ./binds.lua;
    "hypr/input.lua".source = ./input.lua;
    "hypr/rules.lua".source = ./rules.lua;

    "hypr/colors.lua".text = ''
      return {
      ${colors}
      }
    '';

    "hypr/monitors.lua".text = monitors;

    "hypr/values.lua".text = ''
      return {
          repeat_delay = ${toString osConfig.graphical.repeatDelay},
          repeat_rate = ${toString osConfig.graphical.repeatRate},
      }
    '';
  };
}
