{
  imports = [
    ./acme.nix
    ./couchdb.nix
    ./freshrss.nix
    ./hardware.nix
    ./nginx.nix
    ./programs.nix
    ./storage.nix
  ];

  ddns.enable = true;
  fail2ban.enable = true;
  networking.firewall.enable = true;
  upnp.enable = true;
  wireguard.server.enable = true;

  time.timeZone = "America/New_York";
}
