{
  imports = [
    ./acme.nix
    ./couchdb.nix
    ./ddns.nix
    ./hardware.nix
    ./nginx.nix
    ./programs.nix
    ./storage.nix
    ./upnp.nix
  ];

  networking.firewall.enable = true;
  time.timeZone = "America/New_York";
}
