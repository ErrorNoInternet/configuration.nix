{
  lib,
  pkgs,
  self,
  ...
}:
let
  version = lib.removePrefix "v" self.pins.sunshine.version;
in
pkgs.sunshine.overrideAttrs (old: {
  inherit version;
  src = self.pins.sunshine // {
    rev = self.pins.sunshine.revision;
  };

  patches = (old.patches or [ ]) ++ [
    ./map-absolute-input-compositor-desktop.patch
  ];

  ui = old.ui.overrideAttrs (oldUi: {
    inherit version;
    src = self.pins.sunshine;

    npmDeps = pkgs.fetchNpmDeps {
      src = self.pins.sunshine;
      name = oldUi.npmDeps.name;
      hash = "sha256-cRSN3Oq7wu75ceQPw+X6sL81loAZjvdX4W6RkuWLg7Q=";
    };
  });
})
