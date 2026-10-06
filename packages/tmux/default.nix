{
  lib,
  pkgs,
  self,
  ...
}:
pkgs.tmux.overrideAttrs (old: {
  version = "next-3.9";
  src = self.pins.tmux;
  patches = (old.patches or [ ]) ++ [ ./da1-kitty.diff ];
  buildInputs = (old.buildInputs or [ ]) ++ [
    pkgs.libpng
    pkgs.zlib
  ];
  configureFlags = lib.remove "--enable-sixel" old.configureFlags ++ [ "--enable-images" ];
})
