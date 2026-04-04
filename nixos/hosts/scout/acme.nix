{
  config,
  pkgs,
  self,
  ...
}:
let
  domainName = "errornointernet.tuxcord.net";
in
{
  age.secrets.ntfy.file = "${self}/agenix/ntfy.age";

  security.acme = {
    acceptTerms = true;

    defaults = {
      email = "error@tuxcord.net";
      reloadServices = [ "nginx" ];
      postRun = ''
        source ${config.age.secrets.ntfy.path}
        export NTFY_TOPIC=$TOPIC_acme
        ${pkgs.ntfy-sh}/bin/ntfy publish -T recycle -t "${config.host.name}" "HTTPS certificate has been renewed"
      '';
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
