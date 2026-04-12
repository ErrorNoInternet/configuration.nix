{ config, ... }:
{
  rum.programs.direnv = {
    enable = true;
    integrations.fish.enable = config.rum.programs.fish.enable;
  };
}
