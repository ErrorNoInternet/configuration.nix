{
  config,
  lib,
  pkgs,
  self,
  ...
}:
let
  cfg = config.programs.aerc;
  inherit (lib)
    mkEnableOption
    mkIf
    ;
in
{
  options.programs.aerc = {
    enable = mkEnableOption "";
  };

  config = mkIf cfg.enable {
    age.secrets.aercAccounts = {
      file = "${self}/agenix/aerc.age";
      owner = "error";
      group = "users";
    };

    environment.systemPackages = [
      (pkgs.aerc.overrideAttrs (_old: {
        postFixup = ''
          wrapProgram $out/bin/aerc \
            --add-flags "--accounts-conf ${config.age.secrets.aercAccounts.path}"
        '';
      }))
    ];
  };
}
