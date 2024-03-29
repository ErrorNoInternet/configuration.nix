{pkgs, ...}: {
  programs.nixvim = {
    extraPackages = with pkgs; [
      lldb
    ];

    plugins = {
      markdown-preview.enable = true;

      nix-develop.enable = true;

      gitblame.enable = true;

      todo-comments.enable = true;

      comment-nvim.enable = true;

      nvim-autopairs.enable = true;

      treesitter = {
        enable = true;
        nixvimInjections = true;

        incrementalSelection.enable = true;
      };

      treesitter-context = {
        enable = true;
        minWindowHeight = 12;
        maxLines = 3;
      };
    };

    extraConfigLuaPost = ''
      local cmp_autopairs = require('nvim-autopairs.completion.cmp')
      local cmp = require('cmp')
      cmp.event:on(
        'confirm_done',
        cmp_autopairs.on_confirm_done()
      )
    '';

    globals.gitblame_enabled = 0;
  };
}
