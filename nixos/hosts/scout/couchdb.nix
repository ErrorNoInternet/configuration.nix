{ config, self, ... }:
{
  environment.persistence."/persist".directories = [
    {
      directory = "/var/lib/couchdb";
      group = "couchdb";
      user = "couchdb";
    }
  ];

  age.secrets.couchdb = {
    file = "${self}/agenix/couchdb.age";
    group = "couchdb";
    owner = "couchdb";
  };

  services.couchdb = {
    enable = true;
    extraConfigFiles = [ config.age.secrets.couchdb.path ];
  };
}
