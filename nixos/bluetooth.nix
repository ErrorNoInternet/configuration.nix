{
  hardware.bluetooth.enable = true;
  services.blueman.enable = true;
  systemd.services."app-blueman@autostart".enable = false;
}
