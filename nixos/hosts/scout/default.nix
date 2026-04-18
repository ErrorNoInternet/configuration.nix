{
  imports = [
    ./acme.nix
    ./couchdb.nix
    ./freshrss.nix
    ./hardware.nix
    ./nginx.nix
    ./programs.nix
    ./storage.nix
    ./upnp.nix
  ];

  ddns.enable = true;
  fail2ban.enable = true;
  networking.firewall.enable = true;
  wireguard.server.enable = true;

  time.timeZone = "America/New_York";
}
