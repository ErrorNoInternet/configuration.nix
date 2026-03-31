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
    environment.systemPackages = with pkgs; [
      clang
      cspell
      gh
      git-graph
      go
      graphviz
      lua
      mold
      nixfmt
      onefetch
      pandoc
      pkg-config
      rustup
      tokei
      toolbox
      zig
    ];
  };
}
