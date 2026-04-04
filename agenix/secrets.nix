let
  moss = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIA4uIe2N455VCDagDux58713OyhpCzpDMRJZb0ebxs4g";
  scout = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAINxOfqVk56VD9aifCt5OWqUINP/+q5XjSCTv0SsOErHW";
  zenith = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIHwJ6RJApteQw7nKq/dAyUC5gMf+q34bFivpBoE5eOeF";
  systems = [
    moss
    scout
    zenith
  ];
in
{
  "aerc.age".publicKeys = [ zenith ];
  "couchdb.age".publicKeys = [
    zenith
    scout
  ];
  "ddns.age".publicKeys = systems;
  "freshrss.age".publicKeys = [
    zenith
    scout
  ];
  "usbguard.age".publicKeys = [ zenith ];
  "users/error.age".publicKeys = systems;
  "users/root.age".publicKeys = systems;
  "wifi.age".publicKeys = systems;
}
