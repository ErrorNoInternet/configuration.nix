{pkgs, ...}: {
  environment.motd = "";
  nix.extraOptions = ''
    experimental-features = nix-command flakes
  '';

  user.shell = "${pkgs.fish}/bin/fish";
  environment.packages = with pkgs; [
    neofetch

    curl
    dig
    file
    gawk
    glibc
    gnugrep
    gnupg
    gnutar
    gzip
    iproute2
    ncurses
    nmap
    openssh
    perl
    procps
    procs
    ripgrep
    wget
    which
    xxd
  ];

  home-manager = {
    config = {home.stateVersion = "23.05";};
    useUserPackages = true;
  };
  system.stateVersion = "23.05";
}
