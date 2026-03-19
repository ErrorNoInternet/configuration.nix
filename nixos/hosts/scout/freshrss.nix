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
    passwordFile = config.age.secrets.freshrss.path;
    baseUrl = "https://scout.errornointernet.tuxcord.net:18080";
  };
}
