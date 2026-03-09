{ config, ... }:
let
  domainName = "errornointernet.tuxcord.net";
in
{
  security.acme = {
    acceptTerms = true;

    defaults = {
      email = "error@tuxcord.net";
      reloadServices = [ "nginx" ];
    };

    certs.${domainName} = {
      dnsProvider = "rfc2136";
      environmentFile = config.age.secrets.ddns.path;
      extraDomainNames = [
        "*.${domainName}"
        "*.error.tuxcord.net"
        "error.tuxcord.net"
      ];
    };
  };
}
