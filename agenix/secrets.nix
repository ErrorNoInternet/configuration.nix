let
  zenith = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIHwJ6RJApteQw7nKq/dAyUC5gMf+q34bFivpBoE5eOeF";
  systems = [ zenith ];
in
{
  "aerc.age".publicKeys = [ zenith ];
  "usbguard.age".publicKeys = [ zenith ];
  "users/error.age".publicKeys = systems;
  "users/root.age".publicKeys = systems;
  "wifi.age".publicKeys = systems;
}
