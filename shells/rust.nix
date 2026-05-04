{
  perSystem =
    { inputs', pkgs, ... }:
    let
      mkShell =
        toolchain:
        let
          rust = inputs'.fenix.packages.${toolchain}.withComponents [
            "cargo"
            "clippy"
            "rust-analyzer"
            "rust-src"
            "rustc"
            "rustfmt"
          ];
        in
        pkgs.mkShell {
          name = "rust";

          packages = with pkgs; [
            rust

            gcc
            libclang
            llvmPackages.bintools
            pkg-config

            alsa-lib.dev
            libiconv
            libjack2
            libxkbcommon
            openssl.dev
            protobuf
            sqlite
            zlib
          ];

          env = {
            PKG_CONFIG_PATH = "${pkgs.openssl.dev}/lib/pkgconfig";
            LIBCLANG_PATH = "${pkgs.libclang.lib}/lib";
            RUST_SRC_PATH = "${rust}/lib/rustlib/src/rust/library";
          };
        };
    in
    {
      devShells = {
        rust = mkShell "stable";
        rust-nightly = mkShell "complete";
      };
    };
}
