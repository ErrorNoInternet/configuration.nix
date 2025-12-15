let
  moss = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIA4uIe2N455VCDagDux58713OyhpCzpDMRJZb0ebxs4g";
  zenith = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIHwJ6RJApteQw7nKq/dAyUC5gMf+q34bFivpBoE5eOeF";
  systems = [
    moss
    zenith
  ];
in
{
  "aerc.age".publicKeys = [ zenith ];
  "usbguard.age".publicKeys = [ zenith ];
  "users/error.age".publicKeys = systems;
  "users/root.age".publicKeys = systems;
  "wifi.age".publicKeys = systems;
}
