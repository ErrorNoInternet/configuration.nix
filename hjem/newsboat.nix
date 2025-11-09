{
  xdg.config.files = {
    "newsboat/binds".text = ''
      bind-key    O   open-in-browser
      bind-key    o   open-in-browser-and-mark-read
    '';

    "newsboat/colors".text = ''
      color article               color15   default
      color background            color15   default
      color hint-description      color15   color0
      color hint-key              color15   color0
      color hint-keys-delimiter   color15   color0
      color hint-separator        color15   color0
      color info                  color15   color0
      color listfocus             color15   color8   bold
      color listfocus_unread      color11   color8   bold
      color listnormal            color15   default
      color listnormal_unread     color11   default  bold
      color title                 color15   color0
    '';

    "newsboat/config".text = ''
      include                                     colors
      include                                     binds

      auto-reload                                 true
      keep-articles-days                          365
      openbrowser-and-mark-jumps-to-next-unread   true
      refresh-on-startup                          true
      reload-time                                 30
      scrolloff                                   5
      show-keymap-hint                            false
      swap-title-and-hints                        true
    '';

    "newsboat/urls".text = ''
      "query:(all):total_count > 0"
      https://feeds.arstechnica.com/arstechnica/index "~Ars Technica"
      https://www.bleepingcomputer.com/feed/
      https://fedoramagazine.org/feed/
      https://gfw.report/index.xml "~GFW Report"
      https://hnrss.org/frontpage?points=10 "~Hacker News"
      https://lwn.net/headlines/rss
      https://nixos.org/blog/announcements-rss.xml
      https://www.phoronix.com/rss.php
    '';
  };
}
