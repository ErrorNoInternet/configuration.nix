{ inputs, ... }:
{
  perSystem =
    { pkgs, ... }:
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
          inputs.agenix.packages.${stdenv.hostPlatform.system}.default
          inputs.disko.packages.${stdenv.hostPlatform.system}.default
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
