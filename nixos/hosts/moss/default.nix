{
  imports = [
    ./hardware.nix
    ./nfs.nix
    ./programs.nix
    ./storage.nix
  ];

  ddns.enable = true;

  time.timeZone = "America/New_York";
}
