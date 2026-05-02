{
  config,
  lib,
  ...
}:
let
  cfg = config.libvirt;
  inherit (lib)
    mkEnableOption
    mkIf
    ;
in
{
  options.libvirt = {
    enable = mkEnableOption "";
  };

  config = mkIf cfg.enable {
    users.users.error.extraGroups = [ "libvirtd" ];

    virtualisation = {
      libvirtd.enable = true;
      spiceUSBRedirection.enable = true;
    };

    programs.virt-manager.enable = true;
  };
}
