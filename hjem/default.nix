{
  config,
  inputs,
  lib,
  pkgs,
  self,
  ...
}:
let
  inherit (lib) mkIf;
in
{
  hjem = {
    clobberByDefault = true;
    linker = inputs.hjem.packages.${pkgs.stdenv.hostPlatform.system}.smfh;
    specialArgs = { inherit self; };

    extraModules = [
      inputs.hjem-rum.hjemModules.default

      ./aerc.nix
      ./btop.nix
      ./cava.nix
      ./cursor.nix
      ./electron.nix
      ./environment.nix
      ./fastfetch.nix
      ./fish
      ./fzf.nix
      ./git.nix
      ./gnupg.nix
      ./gtk.nix
      ./hyprland
      ./kitty.nix
      ./mpv.nix
      ./nb.nix
      ./newsboat.nix
      ./nvtop.nix
      ./prismlauncher.nix
      ./qalculate.nix
      ./qt.nix
      ./ssh.nix
      ./tmux.nix
      ./vesktop.nix
      ./vimiv.nix
      ./xdg.nix
      ./zoxide.nix
    ];

    users.error = {
      enable = true;

      xdg.config.files = {
        "nvim".source = ./nvim;
      };
    };
  };
}
