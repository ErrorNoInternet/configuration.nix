{ lib, ... }:
{
  rum.desktops.hyprland.extraConfig =
    let
      mkWindowRules =
        attrs: lib.concatMap (a: map (rule: "windowrule = ${rule}, ${a.selector}") a.rules) attrs;

      mkLayerRules =
        attrs: lib.concatMap (a: map (rule: "layerrule = ${rule}, ${a.target}") a.rules) attrs;

      windowRuleSets = [
        {
          selector = "class:lowfi";
          rules = [
            "size 306 82"
            "center"
            "float"
          ];
        }
        {
          selector = "class:qalculate-gtk";
          rules = [
            "size 720 540"
            "float"
          ];
        }
        {
          selector = "class:kitty";
          rules = [ "size 980 630" ];
        }
        {
          selector = "class:org.mozilla.firefox";
          rules = [ "size 980 630" ];
        }

        {
          selector = "class:blueman-manager";
          rules = [
            "animation slide"
            "center"
            "float"
            "size 60% 65%"
          ];
        }
        {
          selector = "class:xdg-desktop-portal";
          rules = [
            "animation slide"
            "center"
            "float"
            "size 60% 65%"
          ];
        }
        {
          selector = "title:File Upload";
          rules = [
            "animation slide"
            "center"
            "float"
            "size 60% 65%"
          ];
        }
        {
          selector = "title:Open";
          rules = [
            "animation slide"
            "center"
            "float"
            "size 60% 65%"
          ];
        }
        {
          selector = "title:Save As";
          rules = [
            "animation slide"
            "center"
            "float"
            "size 60% 65%"
          ];
        }

        {
          selector = "class:branchdialog";
          rules = [ "float" ];
        }
        {
          selector = "class:confirm";
          rules = [ "float" ];
        }
        {
          selector = "class:dialog";
          rules = [ "float" ];
        }
        {
          selector = "class:error";
          rules = [ "float" ];
        }
        {
          selector = "class:mpv";
          rules = [ "float" ];
        }
        {
          selector = "class:notification";
          rules = [ "float" ];
        }
        {
          selector = "class:org.kde.kdeconnect.daemon";
          rules = [ "float" ];
        }
        {
          selector = "class:pavucontrol";
          rules = [ "float" ];
        }
        {
          selector = "class:vimiv";
          rules = [ "float" ];
        }
      ];

      layerRuleSets = [
        {
          target = "hyprpicker";
          rules = [ "animation fade" ];
        }
      ];
    in
    ''
      ${lib.concatStringsSep "\n" (mkWindowRules windowRuleSets)}
      ${lib.concatStringsSep "\n" (mkLayerRules layerRuleSets)}
    '';
}
