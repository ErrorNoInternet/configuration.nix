{
  perSystem =
    {
      inputs',
      lib,
      pkgs,
      ...
    }:
    let
      muslTarget = "x86_64-unknown-linux-musl";

      mkShell =
        toolchain:
        {
          static ? false,
        }:
        let
          fenix = inputs'.fenix.packages;
          rust = fenix.combine (
            [
              (fenix.${toolchain}.withComponents (
                [
                  "cargo"
                  "clippy"
                  "rust-analyzer"
                  "rust-src"
                  "rustc"
                  "rustfmt"
                ]
                ++ lib.optionals (toolchain == "complete") [
                  "miri-preview"
                ]
              ))
            ]
            ++ lib.optionals static [
              fenix.targets.${muslTarget}.${if toolchain == "complete" then "latest" else toolchain}.rust-std
            ]
          );
          muslCC = pkgs.pkgsCross.musl64.stdenv.cc;
          muslBinutils = pkgs.pkgsCross.musl64.binutils;
          muslHeaders = pkgs.pkgsCross.musl64.musl.dev;
        in
        pkgs.mkShell {
          name = "rust${lib.optionalString static "-static"}";

          packages =
            with pkgs;
            [
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
            ]
            ++ lib.optionals static [
              muslCC
              muslBinutils
            ];

          env = {
            PKG_CONFIG_PATH = "${pkgs.openssl.dev}/lib/pkgconfig";
            LIBCLANG_PATH = "${pkgs.libclang.lib}/lib";
            RUST_SRC_PATH = "${rust}/lib/rustlib/src/rust/library";
          }
          // lib.optionalAttrs static {
            CARGO_BUILD_TARGET = muslTarget;
            CARGO_TARGET_X86_64_UNKNOWN_LINUX_MUSL_LINKER = "${muslCC}/bin/${muslTarget}-cc";
            CC_x86_64_unknown_linux_musl = "${muslCC}/bin/${muslTarget}-cc";
            AR_x86_64_unknown_linux_musl = "${muslCC.bintools}/bin/${muslTarget}-ar";
            BINDGEN_EXTRA_CLANG_ARGS_x86_64_unknown_linux_musl = "--sysroot=${muslHeaders}";
          };
        };
    in
    {
      devShells = {
        rust = mkShell "stable" { };
        rust-static = mkShell "stable" { static = true; };
        rust-nightly = mkShell "complete" { };
        rust-nightly-static = mkShell "complete" { static = true; };
      };
    };
}
