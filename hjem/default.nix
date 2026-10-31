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
      ./hyprtoolkit.nix
      ./iamb.nix
      ./irssi
      ./jujutsu.nix
      ./kdeconnect.nix
      ./kitty.nix
      ./mangohud.nix
      ./mpv.nix
      ./newsboat.nix
      ./noctalia.nix
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
      inputs.hjem-rum.hjemModules.default
      inputs.noctalia.hjemModules.default
    ];

    users.error = {
      enable = true;

      files.".face".source = builtins.fetchurl {
        url = "https://avatars.githubusercontent.com/u/61157623";
        sha256 = "12ksaj95f5lsca3hmbasd2caqfz7i6brqyjrrw3xnzjlrmwr8r6j";
      };
    };

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
