{
  osConfig,
  lib,
  ...
}:
let
  inherit (lib)
    concatMapStringsSep
    concatStringsSep
    elemAt
    mapAttrsToList
    mkIf
    strings
    splitString
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

  monitors = concatMapStringsSep "\n" (
    monitor:
    let
      field = map strings.trim (splitString "," monitor);
      extra = if builtins.length field > 4 then ", ${elemAt field 4}" else "";
    in
    ''hl.monitor({ output = "${elemAt field 0}", mode = "${elemAt field 1}", position = "${elemAt field 2}", scale = ${
      if elemAt field 3 == "auto" then "\"auto\"" else elemAt field 3
    }${extra} })''
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
