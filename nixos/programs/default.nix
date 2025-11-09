{
  config,
  inputs',
  lib,
  pkgs,
  ...
}:
{
  imports = [
    ./yazi
  ];

  services = {
    mullvad-vpn.enable = true;
  };

  programs = {
    dconf.enable = true;

    fish = {
      enable = true;
      shellAliases = lib.mkForce { };
    };

    git = {
      enable = true;
      lfs.enable = true;
    };

    gnupg.agent.enable = true;

    ssh.startAgent = true;

    nix-index-database.comma.enable = true;

    nix-index = {
      enableBashIntegration = false;
      enableFishIntegration = false;
      enableZshIntegration = false;
    };
  };

  environment.systemPackages = with pkgs; [
    (aerc.overrideAttrs (old: {
      postFixup = ''
        wrapProgram $out/bin/aerc \
          --add-flags "--accounts-conf ${config.age.secrets.aercAccounts.path}"
      '';
    }))

    bat
    binsort
    btop-cuda
    cmatrix
    croc
    delta
    duf
    eza
    fastfetch
    fd
    gcal
    git-graph
    gnupg
    inputs'.agenix.packages.default
    inputs'.nix-super.packages.default
    inputs'.shadower.packages.shadower
    jq
    jujutsu
    killall
    libqalculate
    microfetch
    nb
    neovim
    nh
    nix-output-monitor
    nixfmt-rfc-style
    npins
    nvme-cli
    nvtopPackages.full
    pandoc
    pinentry-curses
    python3
    python3Packages.bpython
    ripgrep
    smartmontools
    tmux
    tokei
    translate-shell
    vgrep
    vim
  ];
}
