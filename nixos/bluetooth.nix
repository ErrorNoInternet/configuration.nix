{
  hardware.bluetooth.enable = true;
  services.blueman.enable = true;

  hjem.users.error.systemd.services."app-blueman@autostart".enable = false;
}
