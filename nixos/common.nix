{
  config,
  inputs',
  inputs,
  lib,
  pkgs,
  self,
  ...
}:
let
  inherit (lib) mkDefault mkIf;
in
{
  imports = with inputs; [
    agenix.nixosModules.default
    base16.nixosModule
    disko.nixosModules.default
    hjem.nixosModules.default
    impermanence.nixosModules.default
    nix-index-database.nixosModules.nix-index
    noctalia.nixosModules.default
    sbox.nixosModules.default
    spicetify-nix.nixosModules.default

    ../hjem
    ./bluetooth.nix
    ./dns.nix
    ./environment.nix
    ./hardware.nix
    ./impermanence.nix
    ./modules
    ./programs
  ];

  age.secrets = {
    errorPassword.file = ../agenix/users/error.age;
    rootPassword.file = ../agenix/users/root.age;
  };

  documentation.man.cache = {
    enable = true;
    generateAtRuntime = true;
  };

  nix = {
    package = inputs'.nix-super.packages.default;

    settings = {
      auto-optimise-store = true;
      experimental-features = [
        "ca-derivations"
        "flakes"
        "nix-command"
      ];
      log-lines = 500;
      show-trace = true;
      trusted-users = [
        "@wheel"
      ];

      min-free = 10 * 1024 * 1024 * 1024;
      max-free = 50 * 1024 * 1024 * 1024;
    };

    registry =
      let
        mappedRegistry = lib.mapAttrs' (name: flake: lib.nameValuePair name { inherit flake; }) inputs;
      in
      mappedRegistry // { default = mappedRegistry.nixpkgs; };

    gc = {
      automatic = true;
      dates = "weekly";
      options = "--delete-older-than 30d";
    };
  };

  boot = {
    loader = {
      grub = {
        enable = mkDefault true;
        efiSupport = true;
        efiInstallAsRemovable = true;
        device = "nodev";
        splashImage = null;
        configurationLimit = 100;
      };
      timeout = 1;
    };

    kernelPackages = mkDefault pkgs.linuxPackages_latest;
    kernelParams = [
      "boot.shell_on_fail"
      "zswap.enabled=0"
    ];

    binfmt = {
      emulatedSystems = mkIf pkgs.stdenv.hostPlatform.isx86 [ "aarch64-linux" ];
      preferStaticEmulators = true;
    };

    supportedFilesystems = [ "nfs" ];
  };

  networking = {
    networkmanager.enable = true;

    firewall = {
      enable = mkDefault false;

      allowedTCPPorts = [
        22
      ];
      allowedUDPPorts = [
        1900
        5353
      ];
    };
  };

  services = {
    getty = {
      greetingLine = ">>> NixOS ${config.system.nixos.label} (\\m) - \\l";
      helpLine = lib.mkForce "";
    };

    openssh.enable = lib.mkDefault true;

    power-profiles-daemon.enable = true;
  };

  virtualisation.podman.enable = true;

  systemd.coredump.extraConfig = ''
    ProcessSizeMax=2G
    ExternalSizeMax=512M
  '';

  security.sudo.extraConfig = ''
    Defaults:root,%wheel timestamp_timeout=15
  '';

  zramSwap = {
    enable = true;

    algorithm = mkDefault "lzo-rle";
    memoryPercent = 100;
  };

  users.users =
    let
      authorizedKeys = [
        "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIDzdpxex2GlFVf5G2qsh3Ixa/XCMjnbq4JSTmAev7WYJ error.nointernet@gmail.com"
        "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIExq/sL8TLmD7AERh7X9afXlqeuf4g5EeIaoemRf+C7l ErrorNoPhone"
      ];
    in
    {
      root = {
        hashedPasswordFile = config.age.secrets.rootPassword.path;

        openssh.authorizedKeys.keys = authorizedKeys;
      };

      error = {
        hashedPasswordFile = config.age.secrets.errorPassword.path;
        isNormalUser = true;
        shell = pkgs.fish;

        extraGroups = [
          "networkmanager"
          "wheel"
        ];

        openssh.authorizedKeys.keys = authorizedKeys;
      };
    };

  nixpkgs.config.allowUnfree = true;

  environment.etc."nixos/current".source = lib.cleanSource ./..;

  system = {
    configurationRevision = self.rev or self.dirtyRev;
    stateVersion = "25.05";
  };
}
