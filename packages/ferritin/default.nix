{
  lib,
  pkgs,
  self,
  ...
}:
pkgs.rustPlatform.buildRustPackage (finalAttrs: {
  pname = "ferritin";
  version = lib.strings.removePrefix "ferritin-v" self.pins.ferritin.version;

  src = self.pins.ferritin;
  cargoHash = "sha256-8OfDi4MkE5uJ7wtVhnin4sv6w+02nTcADg+KzrE5nwg=";

  nativeBuildInputs = [ pkgs.pkg-config ];

  buildInputs = with pkgs; [
    oniguruma
    zstd
  ];

  doCheck = false;

  env = {
    RUSTONIG_SYSTEM_LIBONIG = true;
    ZSTD_SYS_USE_PKG_CONFIG = true;
  };

  meta = {
    description = "Rust documentation in your terminal";
    homepage = "https://github.com/jbr/ferritin";
    changelog = "https://github.com/jbr/ferritin/blob/${finalAttrs.src.rev}/CHANGELOG.md";
    license = with lib.licenses; [
      asl20
      mit
    ];
    mainProgram = "ferritin";
  };
})
