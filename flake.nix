{
  description = "ErrorNoInternet's NixOS flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nix-on-droid = {
      url = "github:nix-community/nix-on-droid/release-23.05";
      inputs.nixpkgs.follows = "nixpkgs";
      inputs.home-manager.follows = "home-manager";
    };
    agenix.url = "github:ryantm/agenix";

    attic.url = "github:zhaofengli/attic";
    hsize.url = "github:ErrorNoInternet/hsize";
    hyprland.url = "github:hyprwm/Hyprland";
    hyprwm-contrib.url = "github:hyprwm/contrib";
    joshuto.url = "github:kamiyaa/joshuto";
    nix-colors.url = "github:misterio77/nix-colors";
    nix-gaming.url = "github:fufexan/nix-gaming";
    spicetify-nix.url = "github:the-argus/spicetify-nix";
    waybar.url = "github:Alexays/Waybar";
    yazi.url = "github:sxyazi/yazi";
  };

  outputs = {
    self,
    nixpkgs,
    home-manager,
    nix-on-droid,
    agenix,
    ...
  } @ inputs:
  let
    overlays = [
      (self: super: {
        openrgb = super.openrgb.overrideAttrs (oldAttrs: {
          patches = (oldAttrs.patches or []) ++ [
            ./patches/openrgb-hidapi-libusb.patch
          ];
        });
      })
    ];
    pkgs = import nixpkgs {
      inherit overlays;
      system = "x86_64-linux";
      config.allowUnfree = true;
    };
    pkgsArm = import nixpkgs {
      inherit overlays;
      system = "aarch64-linux";
      config = {
        allowUnfree = true;
        allowUnsupportedSystem = true;
      };
    };
  in
  {
    nixosConfigurations = {
      NixBtw = nixpkgs.lib.nixosSystem {
        specialArgs = { inherit inputs pkgs; };
        modules = [
          ./shared/modules/aarch64-emulation.nix
          ./shared/modules/btrfs-subvolume-compression.nix
          ./shared/modules/caches/ErrorNoBinaries.nix
          ./shared/modules/caches/hyprland.nix
          ./shared/modules/caches/nix-gaming.nix
          ./workstation/base.nix
          ./workstation/hosts/NixBtw/hardware-configuration.nix
          ./workstation/hosts/NixBtw/NixBtw.nix
          ./workstation/locations/china.nix
          ./workstation/modules/android-development.nix
          ./workstation/modules/bluetooth.nix
          ./workstation/modules/clamav.nix
          ./workstation/modules/fish.nix
          ./workstation/modules/gaming.nix
          ./workstation/modules/hyprland.nix
          ./workstation/modules/nvidia-options.nix
          ./workstation/modules/nvidia.nix
          ./workstation/modules/openrgb.nix
          ./workstation/modules/video-acceleration.nix
          ./workstation/modules/virtualization.nix
        ];
      };
      Rescanix = nixpkgs.lib.nixosSystem {
        specialArgs = { inherit inputs pkgs; };
        modules = [
          ./shared/modules/aarch64-emulation.nix
          ./shared/modules/btrfs-compression.nix
          ./shared/modules/caches/ErrorNoBinaries.nix
          ./shared/modules/caches/hyprland.nix
          ./shared/modules/caches/nix-gaming.nix
          ./workstation/base.nix
          ./workstation/hosts/Rescanix/hardware-configuration.nix
          ./workstation/hosts/Rescanix/Rescanix.nix
          ./workstation/locations/china.nix
          ./workstation/modules/bluetooth.nix
          ./workstation/modules/clamav.nix
          ./workstation/modules/fish.nix
          ./workstation/modules/gaming.nix
          ./workstation/modules/hyprland.nix
          ./workstation/modules/nvidia-options.nix
          ./workstation/modules/nvidia.nix
          ./workstation/modules/openrgb.nix
          ./workstation/modules/video-acceleration.nix
          ./workstation/modules/virtualization.nix
          ./workstation/modules/vm-guest.nix
          ./workstation/modules/zfs.nix
        ];
      };
      Crix = nixpkgs.lib.nixosSystem {
        specialArgs = { inherit pkgs; };
        modules = [
          agenix.nixosModules.default
          ./server/base.nix
          ./server/hosts/Crix/Crix.nix
          ./server/hosts/Crix/hardware-configuration.nix
          ./server/locations/china.nix
          ./server/modules/bootloader.nix
          ./server/modules/minecraft-server.nix
          ./shared/modules/caches/ErrorNoBinaries.nix
          ./shared/modules/wireless.nix
        ];
      };
      Pix = nixpkgs.lib.nixosSystem {
        pkgs = pkgsArm;
        specialArgs = { inherit inputs; };
        modules = [
          agenix.nixosModules.default
          ./server/base.nix
          ./server/hosts/Pix/hardware-configuration.nix
          ./server/hosts/Pix/Pix.nix
          ./server/locations/china.nix
          ./server/modules/attic-cache.nix
          ./server/modules/nfs.nix
          ./server/modules/printing.nix
          ./server/modules/samba.nix
          ./server/modules/fish.nix
          ./shared/modules/caches/ErrorNoBinaries.nix
          ./shared/modules/raspberry-pi.nix
        ];
      };
    };
    homeConfigurations = {
      "ryan@NixBtw" = home-manager.lib.homeManagerConfiguration {
        inherit pkgs;
        extraSpecialArgs = { inherit inputs; };
        modules = [
          agenix.homeManagerModules.default
          ./home-manager/base.nix
          ./home-manager/hosts/NixBtw.nix
          ./home-manager/locations/china.nix
          ./home-manager/modules/spicetify.nix
          ./shared/modules/caches/ErrorNoBinaries.nix
          ./shared/modules/caches/nix-gaming.nix
        ];
      };
      "ryan@Rescanix" = home-manager.lib.homeManagerConfiguration {
        inherit pkgs;
        extraSpecialArgs = { inherit inputs; };
        modules = [
          agenix.homeManagerModules.default
          ./home-manager/base.nix
          ./home-manager/hosts/Rescanix.nix
          ./home-manager/locations/china.nix
          ./home-manager/modules/spicetify.nix
          ./shared/modules/caches/nix-gaming.nix
          ./shared/modules/caches/ErrorNoBinaries.nix
        ];
      };
      "snowflake@Pix" = home-manager.lib.homeManagerConfiguration {
        pkgs = pkgsArm;
        extraSpecialArgs = { inherit inputs; };
        modules = [
          {
            nixpkgs.config = {
              allowUnsupportedSystem = true;
            };
          }
          agenix.homeManagerModules.default
          ./home-manager/base.nix
          ./home-manager/hosts/Pix.nix
          ./home-manager/locations/china.nix
          ./shared/modules/caches/ErrorNoBinaries.nix
        ];
      };
    };
    nixOnDroidConfigurations.ErrorNoPhone = nix-on-droid.lib.nixOnDroidConfiguration {
      extraSpecialArgs = { inherit inputs; };
      modules = [
        ./nix-on-droid/base.nix
        ./nix-on-droid/hosts/ErrorNoPhone.nix
        ./nix-on-droid/locations/china.nix
        ./nix-on-droid/modules/caches/ErrorNoBinaries.nix
      ];
    };
  };
}
