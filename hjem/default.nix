{
  inputs',
  inputs,
  self',
  self,
  ...
}:
{
  hjem = {
    extraModules = [
      inputs.hjem-rum.hjemModules.default

      ./aerc.nix
      ./applications.nix
      ./atuin.nix
      ./btop.nix
      ./cava.nix
      ./chawan.nix
      ./clang-format.nix
      ./cursor.nix
      ./direnv.nix
      ./eilmeldung.nix
      ./endcord.nix
      ./environment.nix
      ./fastfetch.nix
      ./fcitx5.nix
      ./fish
      ./fuzzel.nix
      ./fzf.nix
      ./gdb.nix
      ./git.nix
      ./gnupg.nix
      ./gtk.nix
      ./hypridle.nix
      ./hyprland
      ./iamb.nix
      ./irssi
      ./jujutsu.nix
      ./kdeconnect.nix
      ./kitty.nix
      ./mangohud.nix
      ./mpv.nix
      ./newsboat.nix
      ./noctalia
      ./nvtop.nix
      ./qalculate.nix
      ./qt.nix
      ./satty.nix
      ./ssh.nix
      ./tmux.nix
      ./tz.nix
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
    };

    linker = inputs'.hjem.packages.smfh;
    clobberByDefault = true;
    specialArgs = {
      inherit
        inputs'
        inputs
        self'
        self
        ;
    };
  };
}
