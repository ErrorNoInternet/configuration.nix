{
  lib,
  pkgs,
  self,
  ...
}:
pkgs.stdenv.mkDerivation rec {
  pname = "gamma-control";
  version = "0.1.0";

  src = self.pins.wlr-clients;

  patches = [
    ./0001-gamma-control-handle-outputs-better.patch
  ];

  nativeBuildInputs = with pkgs; [
    meson
    ninja
    pkg-config
    wayland-protocols
  ];

  buildInputs = with pkgs; [
    libdrm
    libxkbcommon
    wayland
    wayland-protocols
    wayland-scanner
  ];

  installPhase = ''
    mkdir -p $out/bin
    cp gamma-control $out/bin
  '';

  meta = {
    description = "A client for the wlr-gamma-control protocol";
    homepage = "https://gitlab.freedesktop.org/wlroots/wlr-clients";
    license = lib.licenses.mit;
    platforms = lib.platforms.linux;
  };
}
