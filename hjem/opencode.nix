{ lib, osConfig, ... }: {
  xdg.config.files = lib.mkIf (osConfig.host.name == "zenith") {
    "opencode/opencode.jsonc".text = builtins.toJSON {
      "$schema" = "https://opencode.ai/config.json";
      lsp = true;
    };
  };
}
