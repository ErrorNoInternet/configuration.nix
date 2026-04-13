{ lib, pkgs, ... }:
let
  inherit (lib.generators) mkLuaInline;
in
{
  config.vim = {
    autocomplete.blink-cmp = {
      enable = true;

      friendly-snippets.enable = true;

      sourcePlugins = {
        nerdfont = {
          enable = true;
          package = pkgs.vimPlugins.blink-nerdfont-nvim;
          module = "blink-nerdfont";
        };

        yank = {
          enable = true;
          package = pkgs.vimPlugins.blink-cmp-yanky;
          module = "blink-yanky";
        };
      };

      setupOpts = {
        sources.default = [
          "nerdfont"
          "yank"
        ];

        cmdline = {
          sources = [
            "buffer"
            "cmdline"
            "path"
          ];

          completion.list.selection.preselect = false;
        };

        completion.list.selection.preselect = false;

        fuzzy.sorts = [
          (mkLuaInline /* lua */ ''
            function(a, b)
              local source_priority = {
                path = 6,
                lsp = 5,
                snippets = 4,
                nerdfont = 3,
                buffer = 2,
                yank = 1,
              }
              local a_priority = source_priority[a.source_id] or 100
              local b_priority = source_priority[b.source_id] or 100
              if a_priority ~= b_priority then return a_priority > b_priority end
            end
          '')
          "score"
          "sort_text"
        ];
      };
    };
  };
}
