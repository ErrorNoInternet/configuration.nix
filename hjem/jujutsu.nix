{ pkgs, ... }:
{
  xdg.config.files = {
    "jj/config.toml".source = (pkgs.formats.toml { }).generate "config.toml" {
      user = {
        name = "ErrorNoInternet";
        email = "errornointernet@envs.net";
      };

      ui = {
        default-command = [ "log" ];
        diff-editor = ":builtin";
        diff-formatter = ":git";
        pager = "delta";
      };

      aliases = {
        tug = [
          "bookmark"
          "move"
          "--from"
          "heads(::@- & bookmarks())"
          "--to"
          "@-"
        ];
      };

      remotes.origin.auto-track-bookmarks = "*";

      git = {
        sign-on-push = true;
      };

      signing = {
        backend = "gpg";
        behavior = "drop";
        key = "2486BFB7B1E6A4A3";
      };

      lazyjj.diff-tool = "delta";
    };
  };
}
