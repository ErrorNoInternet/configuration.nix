{
  imports = [
    ./ddns.nix
    ./hardware.nix
    ./programs.nix
    ./storage.nix
  ];

  time.timeZone = "America/New_York";
}
