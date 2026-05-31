{ config, self, ... }:
{
  environment.persistence."/persist".directories = [
    {
      directory = "/var/lib/freshrss";
      group = "freshrss";
      user = "freshrss";
    }
  ];

  age.secrets.freshrss = {
    file = "${self}/agenix/freshrss.age";
    group = "freshrss";
    owner = "freshrss";
  };

  services.freshrss = {
    enable = true;
    api.enable = true;
    virtualHost = "freshrss.error.tuxcord.net";
    passwordFile = config.age.secrets.freshrss.path;
    baseUrl = "https://freshrss.error.tuxcord.net:18080";
  };
}
