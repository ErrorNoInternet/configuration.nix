{
  inputs',
  lib,
  pkgs,
  ...
}:
{
  imports = [
    ./aerc.nix
    ./btop.nix
    ./irssi.nix
    ./yazi
  ];

  services = {
    mullvad-vpn.enable = true;
  };

  programs = {
    fish = {
      enable = true;
      shellAliases = lib.mkForce { };
    };

    fuse.userAllowOther = true;

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
    _7zz
    bat
    binsort
    btdu
    cachix
    cmatrix
    compsize
    croc
    deadnix
    delta
    difftastic
    doggo
    duf
    dust
    evcxr
    eza
    fastfetch
    fd
    file
    gcal
    gcc
    gnupg
    hdparm
    hyperfine
    inputs'.agenix.packages.default
    inputs'.nix-super.packages.default
    jq
    jujutsu
    killall
    libqalculate
    lm_sensors
    lowfi
    lsof
    microfetch
    nb
    neovim
    nh
    nix-output-monitor
    npins
    nvme-cli
    openssl
    pinentry-curses
    poop
    python3
    python3Packages.bpython
    ripgrep
    smartmontools
    statix
    tmux
    translate-shell
    try
    vgrep
    vim
  ];
}
