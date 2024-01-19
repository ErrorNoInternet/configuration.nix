{inputs, ...}: {
  imports = [
    ./custom
  ];

  systems = ["x86_64-linux" "aarch64-linux"];
  perSystem = {pkgs, ...}: {
    legacyPackages = with pkgs; {
      nix = nixVersions.nix_2_19.overrideAttrs (oldAttrs: {
        doInstallCheck = false;
        patches =
          (oldAttrs.patches or [])
          ++ [./patches/nix_default-flake.patch];
      });

      btrfs-progs = btrfs-progs.overrideAttrs (oldAttrs: {
        patches =
          (oldAttrs.patches or [])
          ++ [./patches/btrfs-progs_receive-selinux.patch];
      });

      attic = inputs.attic.packages.${system}.attic.overrideAttrs (oldAttrs: {
        patches =
          (oldAttrs.patches or [])
          ++ [./patches/attic_https-api-endpoint.patch];
      });

      yazi = inputs.yazi.packages.${system}.yazi.overrideAttrs (oldAttrs: {
        patches =
          (oldAttrs.patches or [])
          ++ [./patches/yazi_cursor-shape.patch];
      });

      neovim = inputs.neovim.packages.${system}.neovim.overrideAttrs (oldAttrs: {
        patches =
          (oldAttrs.patches or [])
          ++ [./patches/neovim_no-fold-numbers.patch];
      });

      vimPlugins = with pkgs.vimPlugins; {
        barbecue-nvim = barbecue-nvim.overrideAttrs (oldAttrs: {
          patches =
            (oldAttrs.patches or [])
            ++ [./patches/barbecue-nvim_hide-empty.patch];
        });
      };

      nordic = nordic.overrideAttrs (oldAttrs: {
        patches =
          (oldAttrs.patches or [])
          ++ [./patches/nordic_transparent-context-menu.patch];
      });
    };
  };
}
