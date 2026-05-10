{
  lib,
  stdenv,
  self,
  ...
}:
stdenv.mkDerivation rec {
  pname = "btrfs-map-physical";
  version = "unstable-${lib.substring 0 8 src.revision}";

  src = self.pins.osandov-linux;

  strictDeps = true;

  buildPhase = ''
    runHook preBuild

    $CC scripts/btrfs_map_physical.c -o btrfs-map-physical

    runHook postBuild
  '';

  installPhase = ''
    runHook preInstall

    install -Dm755 btrfs-map-physical $out/bin/btrfs-map-physical

    runHook postInstall
  '';

  meta = with lib; {
    description = "Map Btrfs logical extents to physical device offsets";
    homepage = "https://github.com/osandov/osandov-linux";
    license = licenses.gpl2Only;
    platforms = platforms.linux;
    mainProgram = "btrfs-map-physical";
  };
}
