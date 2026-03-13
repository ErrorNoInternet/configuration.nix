{ pkgs, ... }:
{
  config.vim = {
    extraPlugins.spider.package = pkgs.vimPlugins.nvim-spider;

    keymaps = [
      {
        action = "<Cmd>lua require('spider').motion('w')<CR>";
        mode = [
          "n"
          "o"
          "x"
        ];
        key = "w";
      }
      {
        action = "<Cmd>lua require('spider').motion('e')<CR>";
        mode = [
          "n"
          "o"
          "x"
        ];
        key = "e";
      }
      {
        action = "<Cmd>lua require('spider').motion('b')<CR>";
        mode = [
          "n"
          "o"
          "x"
        ];
        key = "b";
      }
      {
        action = "<Cmd>lua require('spider').motion('ge')<CR>";
        mode = [
          "n"
          "o"
          "x"
        ];
        key = "ge";
      }
    ];
  };
}
