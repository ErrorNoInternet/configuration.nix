{
  xdg.config.files = {
    "mimeapps.list".text = ''
      [Default Applications]
      application/pdf=org.mozilla.firefox.desktop
      image/jpeg=vimiv.desktop
      image/png=vimiv.desktop
      x-scheme-handler/discord=vesktop.desktop
      x-scheme-handler/mailto=aerc.desktop
    '';

    "user-dirs.dirs".text = ''
      # shellcheck disable=SC2034

      XDG_DESKTOP_DIR="$HOME"
      XDG_DOCUMENTS_DIR="$HOME"
      XDG_DOWNLOAD_DIR="$HOME/downloads"
      XDG_MUSIC_DIR="$HOME"
      XDG_PICTURES_DIR="$HOME/media/pictures"
      XDG_PUBLICSHARE_DIR="$HOME"
      XDG_TEMPLATES_DIR="$HOME"
      XDG_VIDEOS_DIR="$HOME/media/videos"
    '';
  };
}
