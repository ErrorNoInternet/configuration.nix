{
  environment.variables = {
    EDITOR = "nvim";
    LESS = "-QR";
    MANPAGER = "less -R --use-color -Dd+c -Du+b";
    MANROFFOPT = "-c";
    PAGER = "less";
    VISUAL = "nvim";
  };

  qt = {
    enable = true;
    platformTheme = "qt5ct";
  };

  programs.dconf.profiles.user.databases = [
    {
      settings = {
        "org/gnome/desktop/interface".color-scheme = "prefer-dark";
      };
    }
  ];

  scheme = {
    slug = "kanagawa";
    scheme = "Kanagawa";
    author = "ErrorNoInternet (https://github.com/ErrorNoInternet)";

    base00 = "#1F1F28";
    base01 = "#16161D";
    base02 = "#2D4F67";
    base03 = "#727169";
    base04 = "#C8C093";
    base05 = "#DCD7BA";
    base06 = "#FFFFFF";
    base07 = "#DCD7BA";
    base08 = "#C34043";
    base09 = "#FFA066";
    base0A = "#C0A36E";
    base0B = "#76946A";
    base0C = "#6A9589";
    base0D = "#7E9CD8";
    base0E = "#957FB8";
    base0F = "#FF5D62";
    base10 = "#16161D";
    base11 = "#1F1F28";
    base12 = "#E82424";
    base13 = "#E6C384";
    base14 = "#98BB6C";
    base15 = "#7AA89F";
    base16 = "#7FB4CA";
    base17 = "#938AA9";
  };
}
