{ config, ... }:
{
  rum.programs.zoxide = {
    enable = true;
    integrations.fish.enable = config.rum.programs.fish.enable;
  };
}
