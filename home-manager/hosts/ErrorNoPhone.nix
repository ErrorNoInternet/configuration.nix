{inputs, ...}: let
  custom = {
    predefinedColorScheme = "Nord";
    terminal = "foot";
  };
in {
  _module.args = {inherit custom;};
  imports = [
    ./common.nix
    ../programs/comma.nix
    ../programs/fastfetch.nix
    ../programs/git.nix
  ];

  colorScheme = inputs.nix-colors.colorSchemes.nord;
}
