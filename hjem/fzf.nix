{ config, osConfig, ... }:
{
  rum.programs.fzf = {
    enable = true;
    integrations.fish.enable = config.rum.programs.fish.enable;
  };

  environment.sessionVariables.FZF_DEFAULT_OPTS =
    with osConfig.scheme;
    "--color=fg:#${base04},fg+:#${base05},bg:#${base00},bg+:#${base02}"
    + " --color=hl:#${base0A},hl+:#${base09},info:#${base0E},marker:#${base0B}"
    + " --color=prompt:#${base0A},spinner:#${base0E},pointer:#${base0A},header:#${base14}"
    + " --color=border:#${base03},label:#${base05},query:#${base05}";
}
