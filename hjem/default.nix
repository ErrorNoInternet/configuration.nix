{
  inputs',
  inputs,
  pkgs,
  self',
  self,
  ...
}:
{
  hjem = {
    clobberByDefault = true;
    linker = inputs.hjem.packages.${pkgs.stdenv.hostPlatform.system}.smfh;
    specialArgs = {
      inherit
        inputs'
        inputs
        self'
        self
        ;
    };

    extraModules = [
      inputs.hjem-rum.hjemModules.default

      ./aerc.nix
      ./applications.nix
      ./btop.nix
      ./cava.nix
      ./clang-format.nix
      ./cursor.nix
      ./electron.nix
      ./environment.nix
      ./fastfetch.nix
      ./fcitx5.nix
      ./fish
      ./fzf.nix
      ./gdb.nix
      ./git.nix
      ./gnupg.nix
      ./gtk.nix
      ./hypridle.nix
      ./hyprland
      ./irssi
      ./jujutsu.nix
      ./kitty.nix
      ./mangohud.nix
      ./mpv.nix
      ./nb.nix
      ./newsboat.nix
      ./noctalia.nix
      ./nvtop.nix
      ./prismlauncher.nix
      ./qalculate.nix
      ./qt.nix
      ./satty.nix
      ./ssh.nix
      ./tmux.nix
      ./vesktop.nix
      ./vimiv.nix
      ./xdg.nix
      ./zoxide.nix
    ];

    users.error = {
      enable = true;

      files.".face".source = builtins.fetchurl {
        url = "https://avatars.githubusercontent.com/u/61157623";
        sha256 = "0k90jpmp82f237b8cwpjdlybfc0gqm3f4l491zxii29ncln2dcb3";
      };

      xdg.config.files = {
        "nvim".source = ./nvim;
      };
    };
  };
}
