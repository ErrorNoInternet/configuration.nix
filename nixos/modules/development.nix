{
  config,
  lib,
  pkgs,
  ...
}:
let
  cfg = config.development;
  inherit (lib)
    mkEnableOption
    mkIf
    ;
in
{
  options.development = {
    enable = mkEnableOption "";

    java.enable = mkEnableOption "";
  };

  config = mkIf cfg.enable {
    documentation.dev.enable = true;

    nixpkgs.overlays = [
      (_final: prev: {
        mold-unwrapped = prev.mold-unwrapped.overrideAttrs (old: {
          postFixup = (old.postFixup or "") + ''
            mkdir -p $out/lib/mold
            [ -e $out/lib/mold/mold-wrapper.so ] || ln -s ../mold-wrapper.so $out/lib/mold/mold-wrapper.so
          '';
        });
      })
    ];

    programs.java = {
      inherit (cfg.java) enable;
      package = pkgs.jdk25;
      binfmt = true;
    };

    environment.systemPackages = with pkgs; [
      bear
      cargo-xwin
      cargo-zigbuild
      clang
      cspell
      deadnix
      evcxr
      flamegraph
      gdb
      gh
      git-graph
      go
      graphviz
      hyperfine
      just
      lua
      mold
      nixfmt
      nixfmt-tree
      onefetch
      pandoc
      pkg-config
      rustup
      sqlite
      statix
      tokei
      toolbox
      upx
      valgrind
      zig
    ];
  };
}
