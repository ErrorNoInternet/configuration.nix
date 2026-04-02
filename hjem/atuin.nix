{ pkgs, ... }:
{
  xdg.config.files = {
    "atuin/config.toml".source = (pkgs.formats.toml { }).generate "config.toml" {
      sync_frequency = "1h";
    };
  };
}
