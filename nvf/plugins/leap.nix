{
  config.vim = {
    extraPlugins.leap.package = "leap-nvim";

    keymaps = [
      {
        action = "<Plug>(leap-forward)";
        key = "s";
        mode = [
          "n"
          "x"
          "o"
        ];
      }
      {
        action = "<Plug>(leap-backward)";
        key = "S";
        mode = [
          "n"
          "x"
          "o"
        ];
      }
      {
        action = "<Plug>(leap-from-window)";
        key = "gs";
        mode = [
          "n"
          "x"
          "o"
        ];
      }
    ];
  };
}
