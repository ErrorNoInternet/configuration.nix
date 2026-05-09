{
  imports = [
    ./rust.nix
  ];

  perSystem =
    { inputs', pkgs, ... }:
    {
      devShells.default = pkgs.mkShell {
        name = "configuration.nix";

        packages = with pkgs; [
          bat
          cachix
          deadnix
          delta
          git
          hydra-check
          inputs'.agenix.packages.default
          inputs'.disko.packages.default
          jujutsu
          lazyjj
          neovim
          nix-output-monitor
          nixfmt
          npins
          nurl
          parted
          smartmontools
          statix
          tmux
        ];
      };
    };
}
