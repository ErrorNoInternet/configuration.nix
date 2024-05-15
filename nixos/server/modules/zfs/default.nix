{
  config,
  lib,
  pkgs,
  self,
  ...
}: let
  cfg = config.server.zfs;
  inherit (lib) mkEnableOption mkOption mkIf mkDefault;

  version = "2.2.3-unstable-2024-05-03";
  src = pkgs.fetchFromGitHub {
    owner = "openzfs";
    repo = "zfs";
    rev = "04bae5ec95f7273105237159a882d5b72ec2b998";
    hash = "sha256-z9PvV3AHYJnVF5x7mt8KSiMaQ+4D1IBJzkbbffP09AY=";
  };
  patches = import ./patches {inherit self;};
in {
  imports = [
    ./options.nix
    ./zed.nix
  ];

  options.server.zfs = {
    enable = mkEnableOption "" // {default = true;};

    kernelPackages = mkOption {
      default = config.server.kernel.availablePackages.ltsZfs;
    };
  };

  config = mkIf cfg.enable {
    server.kernel.packages = mkDefault (cfg.kernelPackages.extend (_: prev: {
      zfs_unstable = prev.zfs_unstable.overrideAttrs (old: {
        name = "zfs-kernel-${version}-${prev.kernel.version}";
        inherit version src;
        patches = (old.patches or []) ++ patches;
      });
    }));

    boot.zfs.package = pkgs.zfs_unstable.overrideAttrs (old: {
      name = "zfs-user-${version}";
      inherit version src;
      patches = (old.patches or []) ++ patches;
    });
  };
}
