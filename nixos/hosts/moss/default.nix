{
  imports = [
    ./hardware.nix
    ./programs.nix
    ./storage.nix
  ];

  kernel.bore = true;
  time.timeZone = "America/New_York";
}
