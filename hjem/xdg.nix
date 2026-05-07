let
  directories = {
    XDG_DESKTOP_DIR = "$HOME";
    XDG_DOCUMENTS_DIR = "$HOME";
    XDG_DOWNLOAD_DIR = "$HOME/downloads";
    XDG_MUSIC_DIR = "$HOME";
    XDG_PICTURES_DIR = "$HOME/media/pictures";
    XDG_PROJECTS_DIR = "$HOME/projects";
    XDG_PUBLICSHARE_DIR = "$HOME";
    XDG_TEMPLATES_DIR = "$HOME";
    XDG_VIDEOS_DIR = "$HOME/media/videos";
  };
in
{
  xdg.config.files = {
    "user-dirs.dirs".text = builtins.concatStringsSep "\n" (
      builtins.attrValues (builtins.mapAttrs (k: v: ''${k}="${v}"'') directories)
    );
  };

  environment.sessionVariables = directories;
}
