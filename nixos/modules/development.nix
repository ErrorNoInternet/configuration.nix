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
  };

  config = mkIf cfg.enable {
    documentation.dev.enable = true;

    environment.systemPackages = with pkgs; [
      bear
      clang
      cspell
      evcxr
      gh
      git-graph
      go
      graphviz
      hyperfine
      lua
      mold
      nixfmt
      onefetch
      pandoc
      pkg-config
      rustup
      tokei
      toolbox
      valgrind
      zig
    ];
  };
}
