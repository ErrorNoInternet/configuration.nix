{pkgs, ...}: {
  programs.nixvim = {
    extraPackages = with pkgs; [
      alejandra
      black
      clang-tools
    ];
    plugins = {
      markdown-preview.enable = true;

      nix-develop.enable = true;

      gitblame.enable = true;

      todo-comments.enable = true;

      commentary.enable = true;

      nvim-autopairs.enable = true;
    };
    extraPlugins = with pkgs.vimPlugins; [
      neoformat
    ];
    globals.gitblame_enabled = 0;
    extraConfigLuaPost = ''
      local cmp_autopairs = require('nvim-autopairs.completion.cmp')
      local cmp = require('cmp')
      cmp.event:on(
        'confirm_done',
        cmp_autopairs.on_confirm_done()
      )
    '';
  };
}
