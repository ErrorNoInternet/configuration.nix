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

        ".irssi/scripts/disable_znc_beep.pl".text = /* perl */ ''
          use strict;
          use Irssi;

          Irssi::signal_add('channel sync', sub {
              Irssi::settings_set_str("beep_msg_level", "MSGS DCC DCCMSGS HILIGHT NOTICES");
          });
        '';
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
            "crapbuster.pl"
            "mirc_colour_popup.pl"
            "nickcolor_expando.pl"
            "nm2.pl"
          ]
      )
    );

  environment.sessionVariables = mkIf osConfig.programs.irssi.enable {
    AWL_NOTITLE = 1;
  };
}
