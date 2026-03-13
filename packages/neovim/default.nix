{
  inputs,
  pkgs,
  self,
  ...
}:
(inputs.nvf.lib.neovimConfiguration {
  inherit pkgs;
  extraSpecialArgs = { inherit (self) pins; };
  modules = [ "${self}/nvf" ];
}).neovim.overrideAttrs
  (_old: {
    name = "neovim";
  })
