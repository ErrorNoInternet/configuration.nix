{ lib, osConfig, ... }:
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

    config = lib.mkAfter /* fish */ ''
      status is-interactive; and begin
        if not set -q SETTINGS_CONFIGURED
          set -U SETTINGS_CONFIGURED 1
        end

        atuin init fish --disable-up-arrow --disable-ai | source
      end
    '';
  };
}
