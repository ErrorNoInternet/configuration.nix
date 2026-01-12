{
  config,
  lib,
  ...
}:
let
  cfg = config.sysctl;
  inherit (lib)
    mkEnableOption
    mkIf
    ;
in
{
  options.sysctl = {
    enable = mkEnableOption "" // {
      default = true;
    };
  };

  config = mkIf cfg.enable {
    boot.kernel.sysctl = {
      "net.core.default_qdisc" = "cake";

      "vm.page-cluster" = 0;
      "vm.swappiness" = 100;
      "vm.watermark_boost_factor" = 1;

      "net.ipv4.conf.all.accept_redirects" = 0;
      "net.ipv4.conf.all.secure_redirects" = 0;
      "net.ipv4.conf.default.accept_redirects" = 0;
      "net.ipv4.conf.default.secure_redirects" = 0;
      "net.ipv6.conf.all.accept_redirects" = 0;
      "net.ipv6.conf.default.accept_redirects" = 0;
      "net.ipv4.conf.all.rp_filter" = 1;
      "net.ipv4.conf.default.rp_filter" = 1;
      "net.ipv4.tcp_rfc1337" = 1;

      "kernel.sysrq" = 244;
    };
  };
}
