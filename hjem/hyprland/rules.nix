{ lib, ... }:
{
  rum.desktops.hyprland.extraConfig =
    let
      mkWindowRules =
        attrs:
        map (
          a:
          let
            rulePart = lib.concatStringsSep ", " a.rules;
          in
          "windowrule = ${rulePart}, match:${a.match.type} ${a.match.value}"
        ) attrs;

      mkLayerRules =
        attrs:
        map (
          a:
          let
            rulePart = lib.concatStringsSep ", " a.rules;
          in
          "layerrule = ${rulePart}, match:class ${a.class}"
        ) attrs;

      windowRuleSets = [
        {
          match = {
            type = "class";
            value = "lowfi";
          };
          rules = [
            "size 306 82"
            "center on"
            "float on"
          ];
        }
        {
          match = {
            type = "class";
            value = "qalculate-gtk";
          };
          rules = [
            "size 720 540"
            "float on"
          ];
        }
        {
          match = {
            type = "class";
            value = "kitty";
          };
          rules = [ "size 980 630" ];
        }
        {
          match = {
            type = "class";
            value = "org.mozilla.firefox";
          };
          rules = [ "size 980 630" ];
        }

        {
          match = {
            type = "class";
            value = "blueman-manager";
          };
          rules = [
            "animation slide"
            "center on"
            "float on"
            "size (monitor_w*0.6) (monitor_h*0.65)"
          ];
        }
        {
          match = {
            type = "class";
            value = "xdg-desktop-portal";
          };
          rules = [
            "animation slide"
            "center on"
            "float on"
            "size (monitor_w*0.6) (monitor_h*0.65)"
          ];
        }

        {
          match = {
            type = "title";
            value = "File Upload";
          };
          rules = [
            "animation slide"
            "center on"
            "float on"
            "size (monitor_w*0.6) (monitor_h*0.65)"
          ];
        }
        {
          match = {
            type = "title";
            value = "Open";
          };
          rules = [
            "animation slide"
            "center on"
            "float on"
            "size (monitor_w*0.6) (monitor_h*0.65)"
          ];
        }
        {
          match = {
            type = "title";
            value = "Save As";
          };
          rules = [
            "animation slide"
            "center on"
            "float on"
            "size (monitor_w*0.6) (monitor_h*0.65)"
          ];
        }

        {
          match = {
            type = "class";
            value = "branchdialog";
          };
          rules = [ "float on" ];
        }
        {
          match = {
            type = "class";
            value = "confirm";
          };
          rules = [ "float on" ];
        }
        {
          match = {
            type = "class";
            value = "dialog";
          };
          rules = [ "float on" ];
        }
        {
          match = {
            type = "class";
            value = "error";
          };
          rules = [ "float on" ];
        }
        {
          match = {
            type = "class";
            value = "mpv";
          };
          rules = [ "float on" ];
        }
        {
          match = {
            type = "class";
            value = "notification";
          };
          rules = [ "float on" ];
        }
        {
          match = {
            type = "class";
            value = "org.kde.kdeconnect.daemon";
          };
          rules = [ "float on" ];
        }
        {
          match = {
            type = "class";
            value = "pavucontrol";
          };
          rules = [ "float on" ];
        }
        {
          match = {
            type = "class";
            value = "vimiv";
          };
          rules = [ "float on" ];
        }
      ];

      layerRuleSets = [
        {
          class = "hyprpicker";
          rules = [ "animation fade" ];
        }
      ];
    in
    ''
      ${lib.concatStringsSep "\n" (mkWindowRules windowRuleSets)}
      ${lib.concatStringsSep "\n" (mkLayerRules layerRuleSets)}
    '';
}
