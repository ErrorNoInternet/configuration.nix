{ pkgs, ... }:
{
  development.enable = true;

  services = {
    mullvad-vpn.enable = false;
  };

  environment.systemPackages = with pkgs; [
    lego
  ];
}
