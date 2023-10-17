{ config, custom, inputs, lib, ... }:

{
  home.file.".config/eww/style.scss".text = ''
    $base00: #${config.colorScheme.colors.base00};
    $base01: #${config.colorScheme.colors.base01};
    $base02: #${config.colorScheme.colors.base02};
    $base02-transparent: rgba(${builtins.toString (lib.intersperse ", " (inputs.nix-colors.lib.conversions.hexToRGB config.colorScheme.colors.base02))}, ${custom.opacity});
    $base03: #${config.colorScheme.colors.base03};
    $base04: #${config.colorScheme.colors.base04};
    $base05: #${config.colorScheme.colors.base05};
    $base06: #${config.colorScheme.colors.base06};
    $base07: #${config.colorScheme.colors.base07};
    $base08: #${config.colorScheme.colors.base08};
    $base09: #${config.colorScheme.colors.base09};
    $base0A: #${config.colorScheme.colors.base0A};
    $base0B: #${config.colorScheme.colors.base0B};
    $base0C: #${config.colorScheme.colors.base0C};
    $base0D: #${config.colorScheme.colors.base0D};
    $base0E: #${config.colorScheme.colors.base0E};
    $base0F: #${config.colorScheme.colors.base0F};
    $font: ${custom.font}
  '';
}
