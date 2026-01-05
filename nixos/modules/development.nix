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
      git-graph
      nixfmt-rfc-style
      onefetch
      pandoc
      rustup
      tokei
    ];
  };
}
