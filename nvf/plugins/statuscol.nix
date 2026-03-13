{ lib, pkgs, ... }:
let
  inherit (lib.nvim.dag) entryAfter;
in
{
  config.vim = {
    extraPlugins.statuscol.package = pkgs.vimPlugins.statuscol-nvim;

    luaConfigRC.statuscol = entryAfter [ "pluginConfigs" ] /* lua */ ''
      local builtin = require("statuscol.builtin")
      require("statuscol").setup({
        relculright = true,
        segments = {
          { text = { builtin.foldfunc, " " }, click = "v:lua.ScFa" },
          { text = { builtin.lnumfunc }, click = "v:lua.ScLa", },
          {
            sign = { namespace = { ".*" }, maxwidth = 1, colwidth = 1, auto = " ", wrap = true },
            click = "v:lua.ScSa"
          },
        }
      })
    '';
  };
}
