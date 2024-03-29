{
  imports = [
    ./rust.nix
  ];

  perSystem = {
    inputs',
    pkgs,
    self',
    ...
  }: {
    devShells.default = pkgs.mkShell {
      name = "configuration.nix";
      packages = with pkgs; [
        alejandra
        bat
        deadnix
        delta
        git
        inputs'.agenix.packages.default
        inputs'.disko.packages.default
        nix-output-monitor
        parted
        self'.packages.neovim
        self'.packages.nix
        smartmontools
        statix
        tmux
      ];
    };
  };
}
