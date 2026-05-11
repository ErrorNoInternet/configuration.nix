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

    programs.java = {
      inherit (cfg.java) enable;
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
