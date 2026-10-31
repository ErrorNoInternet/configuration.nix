{
  inputs,
  pkgs,
  schemeSlug ? "kanagawa",
  self,
  ...
}:
(inputs.nvf.lib.neovimConfiguration {
  inherit pkgs;
  extraSpecialArgs = {
    inherit (self) pins;
    inherit schemeSlug;
  };
  modules = [ "${self}/nvf" ];
}).neovim.overrideAttrs
  (_old: {
    pname = "neovim";
  })
