{
  host,
  inputs',
  self,
  ...
}:
with self.lib.derivations;
  c.optimizeAllExceptLto host
  (cmake.optimizeLto (
    inputs'.hyprland.packages.default.overrideAttrs {
      prePatch = ''
        git apply ${./remove-wallpapers.patch}
      '';
    }
  ))
