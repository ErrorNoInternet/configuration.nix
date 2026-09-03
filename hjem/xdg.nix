{ osConfig, ... }:
let
  home = osConfig.hjem.users.error.directory;

  directories = {
    XDG_DESKTOP_DIR = home;
    XDG_DOCUMENTS_DIR = home;
    XDG_DOWNLOAD_DIR = "${home}/downloads";
    XDG_MUSIC_DIR = home;
    XDG_PICTURES_DIR = "${home}/media/pictures";
    XDG_PROJECTS_DIR = "${home}/projects";
    XDG_PUBLICSHARE_DIR = home;
    XDG_TEMPLATES_DIR = home;
    XDG_VIDEOS_DIR = "${home}/media/videos";
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
