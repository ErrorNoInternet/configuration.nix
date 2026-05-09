{ lib, osConfig, ... }:
let
  plugins = {
    privacy-indicator = {
      hideInactive = true;
      enableToast = false;
      removeMargins = false;
      iconSpacing = 6;
      activeColor = "primary";
      inactiveColor = "none";
      micFilterRegex = "";
    };

    screen-recorder = {
      hideInactive = true;
      iconColor = "none";
      directory = "~/";
      filenamePattern = "recording_yyyyMMdd_HHmmss";
      frameRate = "60";
      audioCodec = "opus";
      videoCodec = "h264";
      quality = "high";
      colorRange = "limited";
      showCursor = true;
      copyToClipboard = false;
      audioSource = "default_output";
      videoSource = "portal";
      resolution = "original";
      replayEnabled = false;
      replayDuration = "30";
      customReplayDuration = "30";
      replayStorage = "ram";
      restorePortalSession = false;
      customFrameRate = "60";
    };

    special-workspaces = {
      mainIcon = "layout-grid";
      expandDirection = "right";
      primarySymbolColor = "none";
      primaryShowPill = false;
      primaryPillColor = "secondary";
      primarySize = 0.9;
      primaryBorderRadius = 1;
      primaryFocusColor = "primary";
      panelBackgroundColor = "none";
      panelBackgroundEnabled = false;
      workspaces = [
        {
          name = "scratchpad";
          icon = "box-multiple";
          symbolColor = "none";
          showPill = false;
          pillColor = "primary";
          size = 0.9;
          borderRadius = 1;
          focusColor = "primary";
        }
        {
          name = "communication";
          icon = "message";
          symbolColor = "none";
          showPill = false;
          pillColor = "primary";
          size = 0.9;
          borderRadius = 1;
          focusColor = "primary";
        }
        {
          name = "inbox";
          icon = "inbox";
          symbolColor = "none";
          showPill = false;
          pillColor = "primary";
          size = 0.9;
          borderRadius = 1;
          focusColor = "primary";
        }
      ];
      drawer = true;
      hideEmptyWorkspaces = true;
    };

    timer = {
      compactMode = false;
      iconColor = "none";
      textColor = "none";
    };

    unicode-picker = { };
  };
in
{
  xdg.config.files = lib.mkIf osConfig.graphical.enable (
    {
      "noctalia/plugins.json".text = builtins.toJSON {
        version = 2;
        sources = [
          {
            enabled = true;
            name = "Noctalia Plugins";
            url = "https://github.com/noctalia-dev/noctalia-plugins";
          }
        ];
        states = builtins.listToAttrs (
          map (name: {
            inherit name;
            value = {
              enabled = true;
              sourceUrl = "https://github.com/noctalia-dev/noctalia-plugins";
            };
          }) (builtins.attrNames plugins)
        );
      };
    }
    // lib.attrsets.mapAttrs' (
      name: settings:
      lib.attrsets.nameValuePair "noctalia/plugins/${name}/settings.json" {
        text = builtins.toJSON settings;
      }
    ) plugins
  );
}
