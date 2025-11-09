{
  lib,
  osConfig,
  self,
  ...
}:
let
  inherit (lib) mkIf;
in
{
  files =
    let
      scripts = "${self.pins."scripts.irssi.org"}/scripts";
    in
    mkIf osConfig.programs.irssi.enable (
      {
        ".irssi/config".source = ./config;
        ".irssi/default.theme".source = ./default.theme;
        ".irssi/startup".source = ./startup;

        ".irssi/scripts/colour_popup.pl".source = ./scripts/colour_popup.pl;
        ".irssi/scripts/disable_znc_beep.pl".source = ./scripts/disable_znc_beep.pl;
        ".irssi/scripts/extrabuster.pl".source = ./scripts/extrabuster.pl;
      }
      // builtins.listToAttrs (
        map
          (script: {
            name = ".irssi/scripts/${script}";
            value.source = "${scripts}/${script}";
          })
          [
            "adv_windowlist.pl"
            "conceal.pl"
            "nickcolor_expando.pl"
            "nm2.pl"
          ]
      )
    );

  environment.sessionVariables = mkIf osConfig.programs.irssi.enable {
    AWL_NOTITLE = 1;
  };
}
