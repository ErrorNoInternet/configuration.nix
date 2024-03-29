{
  cpus,
  inputs',
  self,
  system,
  ...
}:
self.lib.derivations.optimizeNative {inherit cpus system;}
(self.lib.derivations.optimizeLto (inputs'.nix-super.packages.default.overrideAttrs {
  doCheck = false;
  doInstallCheck = false;
}))
