{ osConfig, ... }:
{
  imports = [
    ./abbreviations.nix
    ./aliases.nix
    ./binds.nix
    ./functions.nix
    ./plugins.nix
    ./programs
    ./theme.nix
  ];

  rum.programs.fish = {
    inherit (osConfig.programs.fish) enable;

    config = ''
      status is-interactive; and begin
        if not set -q SETTINGS_CONFIGURED
          set -U SETTINGS_CONFIGURED 1
        end
      end
    '';
  };
}
