{
  inputs,
  pkgs,
  ...
}: {
  imports = [
    ../shared/caches
    ./modules
    ./profiles
    ./programs
    inputs.agenix.homeManagerModules.default
  ];

  specialisation.outside.configuration = {
    caches.ErrorNoBinaries.internal = false;
  };

  home.packages = with pkgs; [
    cmatrix
    croc
    dua
    eza
    fd
    inputs.hsize.packages.${pkgs.system}.hsize
    jq
    nh
    progress
  ];

  programs.man.generateCaches = false;
  manual.manpages.enable = false;

  home.stateVersion = "23.05";
}
