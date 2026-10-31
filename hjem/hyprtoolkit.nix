{
  osConfig,
  lib,
  ...
}:
{
  xdg.config.files = lib.mkIf osConfig.graphical.enable {
    "hypr/hyprtoolkit.conf".text = with osConfig.scheme; ''
      background = 0xFF${base00}
      base = 0xFF${base10}
      alternate_base = 0xFF${base02}
      text = 0xFF${base04}
      bright_text = 0xFF${base05}
      link_text = 0xFF${base0D}
      accent = 0xFF${base0B}
      accent_secondary = 0xFF${base0D}
    '';
  };
}
