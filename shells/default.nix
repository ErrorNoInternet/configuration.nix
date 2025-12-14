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
          inputs.agenix.packages.${stdenv.hostPlatform.system}.default
          inputs.disko.packages.${stdenv.hostPlatform.system}.default
          neovim
          nix-output-monitor
          nixfmt-rfc-style
          npins
          parted
          smartmontools
          statix
          tmux
        ];
      };
    };
}
