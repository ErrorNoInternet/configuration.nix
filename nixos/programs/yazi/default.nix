{
  config,
  lib,
  pkgs,
  self,
  ...
}:
{
  imports = [
    ./keymap.nix
  ];

  programs.yazi = {
    enable = true;

    plugins = with pkgs; {
      bookmarks = self.pins."bookmarks.yazi";
      inherit (yaziPlugins) chmod;
      inherit (yaziPlugins) diff;
      inherit (yaziPlugins) git;
      inherit (yaziPlugins) jump-to-char;
      inherit (yaziPlugins) mount;
      inherit (yaziPlugins) smart-enter;
      inherit (yaziPlugins) sudo;
      inherit (yaziPlugins) toggle-pane;
    };

    flavors.kanagawa = self.pins."kanagawa.yazi";

    initLua = pkgs.writeText "init.lua" ''
      require("zoxide"):setup({ update_db = true })
      require("git"):setup()
    '';

    settings = {
      yazi = {
        mgr = {
          ratio = [
            1
            4
            3
          ];
          sort_by = "natural";
          sort_sensitive = false;
          sort_reverse = false;
          sort_dir_first = true;
          sort_translit = false;
          linemode = "none";
          show_hidden = false;
          show_symlink = true;
          scrolloff = 5;
          mouse_events = [
            "click"
            "scroll"
          ];
        };

        preview = {
          tab_size = 2;
          max_width = 1000;
          max_height = 1000;
          cache_dir = "";
          image_filter = "triangle";
          image_quality = 75;
          ueberzug_scale = 1;
          ueberzug_offset = [
            0
            0
            0
            0
          ];
        };

        opener = {
          edit = [
            {
              run = "\${EDITOR:=vi} \"$@\"";
              desc = "$EDITOR";
              block = true;
              "for" = "unix";
            }
          ];
          open = [
            {
              run = "xdg-open \"$1\"";
              desc = "Open";
              "for" = "linux";
            }
          ];
          reveal = [
            {
              run = "xdg-open \"$(dirname \"$1\")\"";
              desc = "Reveal";
              "for" = "linux";
            }
            {
              run = "open -R \"$1\"";
              desc = "Reveal";
              "for" = "macos";
            }
            {
              run = "\${EDITOR:=vi} \"$@\"";
              desc = "Edit";
              block = true;
              "for" = "unix";
            }
            {
              run = "exiftool \"$1\"; echo \"Press enter to exit\"; read _";
              block = true;
              desc = "Show EXIF";
              "for" = "unix";
            }
          ];
          extract = [
            {
              run = "ya pub extract --list \"$@\"";
              desc = "Extract here";
              "for" = "unix";
            }
          ];
          play = [
            {
              run = "mpv --force-window \"$@\"";
              orphan = true;
              "for" = "unix";
            }
            {
              run = "mediainfo \"$1\"; echo \"Press enter to exit\"; read _";
              block = true;
              desc = "Show media info";
              "for" = "unix";
            }
          ];
        };

        open = {
          rules = [
            {
              mime = "*/javascript";
              use = [
                "edit"
                "reveal"
              ];
            }
            {
              mime = "application/{,g}zip";
              use = [
                "extract"
                "reveal"
              ];
            }
            {
              mime = "application/{json,x-ndjson}";
              use = [
                "edit"
                "reveal"
              ];
            }
            {
              mime = "application/{tar,bzip*,7z-compressed,xz,rar}";
              use = [
                "extract"
                "reveal"
              ];
            }
            {
              mime = "image/*";
              use = [
                "open"
                "reveal"
              ];
            }
            {
              mime = "inode/x-empty";
              use = [
                "edit"
                "reveal"
              ];
            }
            {
              mime = "text/*";
              use = [
                "edit"
                "reveal"
              ];
            }
            {
              mime = "{audio,video}/*";
              use = [
                "play"
                "reveal"
              ];
            }
            {
              name = "*";
              use = [
                "open"
                "reveal"
              ];
            }
            {
              name = "*/";
              use = [
                "edit"
                "open"
                "reveal"
              ];
            }
          ];
        };

        tasks = {
          micro_workers = 10;
          macro_workers = 25;
          bizarre_retry = 5;
          image_alloc = 512 * 1024 * 1024;
          image_bound = [
            0
            0
          ];
          suppress_preload = false;
        };

        plugin = {
          fetchers = [
            {
              id = "mime";
              name = "*";
              run = "mime";
              "if" = "!mime";
              prio = "high";
            }
          ];
          spotters = [
            {
              mime = "*/{xml,javascript,x-wine-extension-ini}";
              run = "code";
            }
            {
              mime = "image/*";
              run = "image";
            }
            {
              mime = "image/{avif,hei?,jxl,svg+xml}";
              run = "magick";
            }
            {
              mime = "text/*";
              run = "code";
            }
            {
              mime = "video/*";
              run = "video";
            }
            {
              name = "*";
              run = "file";
            }
            {
              name = "*/";
              run = "folder";
            }
          ];
          preloaders = [
            {
              mime = "application/pdf";
              run = "pdf";
            }
            {
              mime = "application/vnd.ms-opentype";
              run = "font";
            }
            {
              mime = "font/*";
              run = "font";
            }
            {
              mime = "image/*";
              run = "image";
            }
            {
              mime = "image/{avif,heic,jxl,svg+xml}";
              run = "magick";
            }
            {
              mime = "video/*";
              run = "video";
            }
          ];
          previewers = [
            {
              mime = "*/{xml,javascript,x-wine-extension-ini}";
              run = "code";
            }
            {
              mime = "application/pdf";
              run = "pdf";
            }
            {
              mime = "application/vnd.ms-opentype";
              run = "font";
            }
            {
              mime = "application/{,g}zip";
              run = "archive";
            }
            {
              mime = "application/{json,x-ndjson}";
              run = "json";
            }
            {
              mime = "application/{tar,bzip*,7z-compressed,xz,rar,iso9660-image}";
              run = "archive";
            }
            {
              mime = "font/*";
              run = "font";
            }
            {
              mime = "image/*";
              run = "image";
            }
            {
              mime = "image/{avif,heic,jxl,svg+xml}";
              run = "magick";
            }
            {
              mime = "text/*";
              run = "code";
            }
            {
              mime = "video/*";
              run = "video";
            }
            {
              name = "*";
              run = "file";
            }
            {
              name = "*/";
              run = "folder";
              sync = true;
            }
          ];

          prepend_fetchers = [
            {
              id = "git";
              name = "*";
              run = "git";
            }
            {
              id = "git";
              name = "*/";
              run = "git";
            }
          ];
        };

        input = {
          cursor_blink = false;

          cd_title = "Change directory:";
          cd_origin = "top-center";
          cd_offset = [
            0
            2
            50
            3
          ];

          create_title = [
            "Create:"
            "Create (directory):"
          ];
          create_origin = "top-center";
          create_offset = [
            0
            2
            50
            3
          ];

          rename_title = "Rename:";
          rename_origin = "hovered";
          rename_offset = [
            0
            1
            50
            3
          ];

          trash_title = "Move {n} selected file{s} to trash? (y/N)";
          trash_origin = "top-center";
          trash_offset = [
            0
            2
            50
            3
          ];

          delete_title = "Delete {n} selected file{s} permanently? (y/N)";
          delete_origin = "top-center";
          delete_offset = [
            0
            2
            50
            3
          ];

          filter_title = "Filter:";
          filter_origin = "top-center";
          filter_offset = [
            0
            2
            50
            3
          ];

          find_title = [
            "Find next:"
            "Find previous:"
          ];
          find_origin = "top-center";
          find_offset = [
            0
            2
            50
            3
          ];

          search_title = "Search via {n}:";
          search_origin = "top-center";
          search_offset = [
            0
            2
            50
            3
          ];

          shell_title = [
            "Shell:"
            "Shell (block):"
          ];
          shell_origin = "top-center";
          shell_offset = [
            0
            2
            50
            3
          ];

          overwrite_title = "Overwrite an existing file? (y/N)";
          overwrite_origin = "top-center";
          overwrite_offset = [
            0
            2
            50
            3
          ];

          quit_title = "{n} task{s} running, sure to quit? (y/N)";
          quit_origin = "top-center";
          quit_offset = [
            0
            2
            50
            3
          ];
        };

        pick = {
          open_title = "Open with:";
          open_origin = "hovered";
          open_offset = [
            0
            1
            50
            7
          ];
        };

        which = {
          sort_by = "none";
          sort_sensitive = false;
          sort_reverse = false;
          sort_translit = false;
        };
      };

      theme = {
        mgr.border_symbol = " ";
      }
      // lib.optionalAttrs (config.scheme.slug == "kanagawa") {
        flavor.dark = "kanagawa";
      };
    };
  };
}
