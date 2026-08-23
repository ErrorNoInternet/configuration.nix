{
  lib,
  pkgs,
  self,
  size ? "standard",
  stdenvNoCC,
  tweaks ? [ ],
  variant ? "default",
  ...
}:
stdenvNoCC.mkDerivation rec {
  pname = "kanagawa-gtk-theme";
  version = "unstable-${lib.substring 0 8 src.revision}";

  src = self.pins.Kanagawa-GKT-Theme;

  nativeBuildInputs = with pkgs; [
    gtk3
    sassc
  ];

  installPhase = ''
    runHook preInstall

    patchShebangs ./themes/install.sh
    ./themes/install.sh \
      --name Kanagawa \
      --tweaks ${lib.concatStringsSep " " tweaks} \
      --theme ${variant} \
      --size ${size} \
      --dest $out/share/themes

    runHook postInstall
  '';

  meta = with lib; {
    description = "GTK theme with the Kanagawa colour palette";
    homepage = "https://github.com/Fausto-Korpsvart/Kanagawa-GKT-Theme";
    license = licenses.gpl3Only;
    maintainers = with maintainers; [ iynaix ];
    platforms = pkgs.gtk3.meta.platforms;
  };
}
