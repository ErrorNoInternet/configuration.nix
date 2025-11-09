{
  rum.programs.git = {
    enable = true;

    settings = {
      advice = {
        addEmptyPathspec = false;
        detachedHead = false;
      };
      branch.sort = "-committerdate";
      core = {
        filemode = true;
        pager = "delta";
      };
      delta = {
        hunk-header-decoration-style = "ul";
        line-numbers = true;
        line-numbers-minus-style = "red";
        line-numbers-plus-style = "green";
        line-numbers-zero-style = "gray";
        navigate = true;
        syntax-theme = "Nord";
      };
      diff = {
        algorithm = "histogram";
        colorMoved = "default";
        submodule = "log";
      };
      "filter \"lfs\"" = {
        clean = "git-lfs clean -- %f";
        process = "git-lfs filter-process";
        required = true;
        smudge = "git-lfs smudge -- %f";
      };
      gpg.program = "gpg2";
      index.version = 4;
      init.defaultBranch = "main";
      interactive.diffFilter = "delta --color-only";
      merge.conflictstyle = "zdiff3";
      pull.rebase = true;
      status.submoduleSummary = true;
      commit.gpgSign = true;
      tag.gpgSign = true;

      user = {
        email = "errornointernet@envs.net";
        name = "ErrorNoInternet";
        signingKey = "2486BFB7B1E6A4A3";
      };
    };
  };
}
