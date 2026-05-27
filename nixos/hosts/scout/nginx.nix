{ pkgs, ... }:
let
  usedTCPPorts = [
    6984
    18080
    18081
  ];
in
{
  environment.persistence."/persist".directories = [
    {
      directory = "/etc/nginx";
      group = "nginx";
      user = "nginx";
    }
  ];

  users = {
    groups.webdav = { };

    users.nginx.extraGroups = [
      "acme"
      "webdav"
    ];
  };

  networking.firewall.allowedTCPPorts = usedTCPPorts;
  upnp.tcpPorts = usedTCPPorts;

  services.nginx = {
    enable = true;
    additionalModules = with pkgs.nginxModules; [ dav ];

    clientMaxBodySize = "256M";
    recommendedProxySettings = true;
    recommendedTlsSettings = true;

    virtualHosts =
      let
        defaultOptions = {
          acmeRoot = null;
          forceSSL = true;
          useACMEHost = "errornointernet.tuxcord.net";
        };
      in
      {
        couchdb = {
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
        }
        // defaultOptions;

        freshrss = {
          listen = [
            {
              addr = "0.0.0.0";
              port = 18080;
              ssl = true;
            }
          ];
        }
        // defaultOptions;

        webdav = {
          listen = [
            {
              addr = "0.0.0.0";
              port = 18081;
              ssl = true;
            }
          ];

          locations."/webdav/" = {
            root = "/srv";

            extraConfig = ''
              client_max_body_size 10G;

              dav_methods PUT DELETE MKCOL COPY MOVE;
              dav_ext_methods PROPFIND OPTIONS;

              create_full_put_path on;
              dav_access user:rw group:rw all:r;

              autoindex on;

              auth_basic "WebDAV";
              auth_basic_user_file /etc/nginx/webdav.htpasswd;
            '';
          };
        }
        // defaultOptions;
      };
  };

  systemd = {
    tmpfiles.rules = [
      "d /srv/webdav 0775 nginx webdav -"
    ];

    services.nginx.serviceConfig.ReadWritePaths = [
      "/srv"
    ];
  };

  environment.systemPackages = with pkgs; [
    apacheHttpd
    nginx
  ];
}
