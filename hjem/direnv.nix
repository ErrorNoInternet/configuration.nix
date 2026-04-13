{ config, osConfig, ... }:
{
  rum.programs.direnv = {
    inherit (osConfig.development) enable;
    integrations.fish = { inherit (config.rum.programs.fish) enable; };
  };
}
