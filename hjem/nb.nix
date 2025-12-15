{ config, ... }:
{
  xdg.config.files."nbrc".text = ''
    #!/usr/bin/env bash

    export NB_AUTO_SYNC="''${NB_AUTO_SYNC:-0}"
    export NB_COLOR_PRIMARY=7
    export NB_COLOR_SECONDARY=4
    export NB_DIR="''${NB_DIR:-/home/error/other/nb}"
  '';

  environment.sessionVariables = {
    NBRC_PATH = "${config.xdg.config.directory}/nbrc";
  };
}
