let
  scopeCharacter = "│";
in
{
  config.vim = {
    visuals.indent-blankline = {
      enable = true;

      setupOpts = {
        indent.char = " ";
        scope.char = scopeCharacter;
      };
    };

    luaConfigRC.ibl = ''
      local hooks = require("ibl.hooks")
      hooks.register(
        hooks.type.VIRTUAL_TEXT,
        function(_, _, _, virt_text)
          if virt_text[1] and virt_text[1][1] == '${scopeCharacter}' then
            virt_text[1] = { ' ', { "@ibl.whitespace.char.1" } }
          end
          return virt_text
        end
      )
    '';
  };
}
