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
