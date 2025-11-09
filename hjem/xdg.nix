{
  xdg.config.files = {
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
