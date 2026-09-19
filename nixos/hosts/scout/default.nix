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

  nix.settings = {
    min-free = 10 * 1024 * 1024 * 1024;
    max-free = 20 * 1024 * 1024 * 1024;
  };

  ddns.enable = true;
  fail2ban.enable = true;
  networking.firewall.enable = true;
  upnp.enable = true;
  wireguard.server.enable = true;

  time.timeZone = "America/New_York";
}
