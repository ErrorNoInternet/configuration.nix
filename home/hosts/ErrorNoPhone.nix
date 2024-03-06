{config, ...}: {
  customPrograms.terminal = {
    git.enable = true;
    nb = {
      enable = true;
      dataDirectory = "/data/data/com.termux.nix/files/home/${config.home.username}/.nb";
    };
  };
}
