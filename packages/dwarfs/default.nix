{
  pkgs,
  self,
  ...
}:
pkgs.dwarfs.overrideAttrs (_old: {
  version = "0.14.1";
  src = self.pins.dwarfs;
  cmakeFlags = [ ];
  postInstall = ''
    rm -rf $out/$out
  '';
})
