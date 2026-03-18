{
  imports = [
    ./acme.nix
    ./couchdb.nix
    ./ddns.nix
    ./freshrss.nix
    ./hardware.nix
    ./nginx.nix
    ./programs.nix
    ./storage.nix
    ./upnp.nix
  ];

  fail2ban.enable = true;
  networking.firewall.enable = true;

  time.timeZone = "America/New_York";
}
