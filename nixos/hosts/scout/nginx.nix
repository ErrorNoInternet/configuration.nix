{
  users.users.nginx.extraGroups = [ "acme" ];

  services.nginx = {
    enable = true;

    clientMaxBodySize = "256M";
    recommendedProxySettings = true;
    recommendedTlsSettings = true;

    virtualHosts = {
      couchdb = {
        acmeRoot = null;
        forceSSL = true;
        useACMEHost = "errornointernet.tuxcord.net";

        listen = [
          {
            addr = "0.0.0.0";
            port = 6984;
            ssl = true;
          }
        ];

        locations."/" = {
          proxyPass = "http://localhost:5984";
          extraConfig = ''
            proxy_pass_header Authorization;
          '';
        };
      };

      freshrss = {
        acmeRoot = null;
        forceSSL = true;
        useACMEHost = "errornointernet.tuxcord.net";

        listen = [
          {
            addr = "0.0.0.0";
            port = 18080;
            ssl = true;
          }
        ];
      };
    };
  };

  networking.firewall.allowedTCPPorts = [
    6984
    18080
  ];
}
