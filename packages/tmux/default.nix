{
  lib,
  pkgs,
  self,
  ...
}:
pkgs.tmux.overrideAttrs (old: {
  version = "3.9";
  src = self.pins.tmux;

  postPatch = (old.postPatch or "") + ''
    substituteInPlace configure.ac --replace-fail \
      'AC_INIT([tmux], next-3.9)' 'AC_INIT([tmux], 3.9)'
  '';

  patches = (old.patches or [ ]) ++ [ ./da1-kitty.diff ];

  buildInputs = (old.buildInputs or [ ]) ++ [
    pkgs.libpng
    pkgs.zlib
  ];

  configureFlags = lib.remove "--enable-sixel" old.configureFlags ++ [ "--enable-images" ];
})
