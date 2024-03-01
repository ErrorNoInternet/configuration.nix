{
  config,
  lib,
  ...
}: let
  cfg = config.customPrograms.terminal.git;
  inherit (lib) mkEnableOption mkIf;
in {
  options.customPrograms.terminal.git.enable = mkEnableOption "";

  config = mkIf cfg.enable {
    programs.git = {
      enable = true;

      userName = "ErrorNoInternet";
      userEmail = "errornointernet@envs.net";
      signing = {
        key = "2486BFB7B1E6A4A3";
        signByDefault = true;
      };
      extraConfig = {
        advice = {
          addEmptyPathspec = false;
          detachedHead = false;
        };
        core.filemode = true;
        index.version = 4;
        init.defaultBranch = "main";
        pull.rebase = false;
      };

      delta = {
        enable = true;
        options = {
          syntax-theme = "Nord";
          side-by-side = true;
          hunk-header-decoration-style = "ul";
          line-numbers-minus-style = "red";
          line-numbers-plus-style = "green";
          line-numbers-zero-style = "gray";
        };
      };
    };
  };
}
