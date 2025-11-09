{
  config,
  pkgs,
  self,
  ...
}:
{
  age.secrets.usbguard.file = "${self}/agenix/usbguard.age";

  environment.systemPackages = [ pkgs.usbguard-notifier ];

  services.usbguard = {
    enable = true;
    IPCAllowedGroups = [ "wheel" ];
    ruleFile = config.age.secrets.usbguard.path;
  };

  hjem.users.error.systemd.services.usbguard-notifier = {
    after = [ "graphical-session.target" ];
    partOf = [ "graphical-session.target" ];
    wantedBy = [ "graphical-session.target" ];
    script = "${pkgs.usbguard-notifier}/bin/usbguard-notifier";
  };
}
