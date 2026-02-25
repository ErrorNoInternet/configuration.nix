{
  config,
  inputs',
  inputs,
  lib,
  pkgs,
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

  documentation = {
    doc.enable = false;
    man.cache = {
      enable = true;
      generateAtRuntime = true;
    };
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

    kernelParams = [ "boot.shell_on_fail" ];
    kernelPackages = pkgs.linuxPackages_latest;

    binfmt.emulatedSystems = mkIf pkgs.stdenv.hostPlatform.isx86 [ "aarch64-linux" ];
  };

  networking = {
    networkmanager.enable = true;
    firewall.enable = false;
  };

  services = {
    pipewire = {
      enable = true;
      pulse.enable = true;
      alsa = {
        enable = true;
        support32Bit = true;
      };
    };

    xserver = {
      enable = true;
      excludePackages = [ pkgs.xterm ];
      displayManager.lightdm.enable = false;
    };

    logind.settings.Login.HandleLidSwitch = "ignore";

    getty = {
      greetingLine = ">>> NixOS ${config.system.nixos.label} (\\m) - \\l";
      helpLine = lib.mkForce "";
    };

    openssh.enable = lib.mkDefault true;
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
    memoryPercent = 200;
  };

  users.users = {
    root.hashedPasswordFile = config.age.secrets.rootPassword.path;

    error = {
      hashedPasswordFile = config.age.secrets.errorPassword.path;
      isNormalUser = true;
      shell = pkgs.fish;

      extraGroups = [
        "wheel"
        "networkmanager"
      ];

      openssh.authorizedKeys.keys = [
        "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIDzdpxex2GlFVf5G2qsh3Ixa/XCMjnbq4JSTmAev7WYJ error.nointernet@gmail.com"
        "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIExq/sL8TLmD7AERh7X9afXlqeuf4g5EeIaoemRf+C7l ErrorNoPhone"
      ];
    };
  };

  nixpkgs.config.allowUnfree = true;

  system.stateVersion = "25.05";
}
