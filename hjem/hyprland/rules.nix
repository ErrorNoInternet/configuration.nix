{ lib, ... }:
{
  rum.desktops.hyprland.extraConfig =
    let
      mkWindowRules =
        attrs:
        map (
          a:
          let
            matchParts = map (m: "match:${m.type} ${m.value}") a.matches;
            allParts = a.rules ++ matchParts;
          in
          "windowrule = ${lib.concatStringsSep ", " allParts}"
        ) attrs;

      mkLayerRules =
        attrs:
        map (
          a:
          let
            matchParts = map (m: "match:${m.type} ${m.value}") a.matches;
            allParts = a.rules ++ matchParts;
          in
          "layerrule = ${lib.concatStringsSep ", " allParts}"
        ) attrs;

      windowRuleSets = [
        {
          matches = [
            {
              type = "class";
              value = "lowfi";
            }
          ];
          rules = [
            "size 306 82"
            "center on"
            "float on"
          ];
        }
        {
          matches = [
            {
              type = "class";
              value = "qalculate-gtk";
            }
          ];
          rules = [
            "size 720 540"
            "float on"
          ];
        }
        {
          matches = [
            {
              type = "class";
              value = "kitty";
            }
          ];
          rules = [ "size 980 630" ];
        }
        {
          matches = [
            {
              type = "class";
              value = "org.mozilla.firefox";
            }
          ];
          rules = [ "size 980 630" ];
        }

        {
          matches = [
            {
              type = "class";
              value = "blueman-manager";
            }
          ];
          rules = [
            "animation slide"
            "center on"
            "float on"
            "size (monitor_w*0.6) (monitor_h*0.65)"
          ];
        }
        {
          matches = [
            {
              type = "class";
              value = "xdg-desktop-portal";
            }
          ];
          rules = [
            "animation slide"
            "center on"
            "float on"
            "size (monitor_w*0.6) (monitor_h*0.65)"
          ];
        }

        {
          matches = [
            {
              type = "title";
              value = "File Upload";
            }
          ];
          rules = [
            "animation slide"
            "center on"
            "float on"
            "size (monitor_w*0.6) (monitor_h*0.65)"
          ];
        }
        {
          matches = [
            {
              type = "title";
              value = "Open";
            }
          ];
          rules = [
            "animation slide"
            "center on"
            "float on"
            "size (monitor_w*0.6) (monitor_h*0.65)"
          ];
        }
        {
          matches = [
            {
              type = "title";
              value = "Save As";
            }
          ];
          rules = [
            "animation slide"
            "center on"
            "float on"
            "size (monitor_w*0.6) (monitor_h*0.65)"
          ];
        }

        {
          matches = [
            {
              type = "class";
              value = "jetbrains-studio";
            }
            {
              type = "title";
              value = "^win(.*)";
            }
          ];
          rules = [ "no_initial_focus on" ];
        }
        {
          matches = [
            {
              type = "class";
              value = "branchdialog";
            }
          ];
          rules = [ "float on" ];
        }
        {
          matches = [
            {
              type = "class";
              value = "confirm";
            }
          ];
          rules = [ "float on" ];
        }
        {
          matches = [
            {
              type = "class";
              value = "dialog";
            }
          ];
          rules = [ "float on" ];
        }
        {
          matches = [
            {
              type = "class";
              value = "error";
            }
          ];
          rules = [ "float on" ];
        }
        {
          matches = [
            {
              type = "class";
              value = "mpv";
            }
          ];
          rules = [ "float on" ];
        }
        {
          matches = [
            {
              type = "class";
              value = "notification";
            }
          ];
          rules = [ "float on" ];
        }
        {
          matches = [
            {
              type = "class";
              value = "org.kde.kdeconnect.daemon";
            }
          ];
          rules = [ "float on" ];
        }
        {
          matches = [
            {
              type = "class";
              value = "pavucontrol";
            }
          ];
          rules = [ "float on" ];
        }
        {
          matches = [
            {
              type = "class";
              value = "vimiv";
            }
          ];
          rules = [ "float on" ];
        }
      ];

      layerRuleSets = [
        {
          matches = [
            {
              type = "namespace";
              value = "hyprpicker";
            }
          ];
          rules = [ "no_anim on" ];
        }
        {
          matches = [
            {
              type = "namespace";
              value = "selection";
            }
          ];
          rules = [ "no_anim on" ];
        }
        {
          matches = [
            {
              type = "namespace";
              value = "noctalia-background-.*";
            }
          ];
          rules = [
            "blur on"
            "ignore_alpha 0.7"
          ];
        }
      ];
    in
    ''
      ${lib.concatStringsSep "\n" (mkWindowRules windowRuleSets)}
      ${lib.concatStringsSep "\n" (mkLayerRules layerRuleSets)}
    '';
}
