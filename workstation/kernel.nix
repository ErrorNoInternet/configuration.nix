{
  pkgs,
  lib,
  ...
}: let
  inherit (lib) mkDefault mkOverride;
in {
  boot = {
    kernelPackages = mkOverride 1250 pkgs.linuxPackages_latest;
    kernelPatches = [
      {
        name = "native CPU optimizations";
        patch = null;
        extraMakeFlags = ["-march=haswell -mtune=haswell"];
      }
      {
        name = "zen kernel patches";
        patch = null;
        extraStructuredConfig = with lib.kernel; {
          PREEMPT = mkOverride 60 yes;
          PREEMPT_VOLUNTARY = mkOverride 60 no;

          TREE_RCU = yes;
          PREEMPT_RCU = yes;
          RCU_EXPERT = yes;
          TREE_SRCU = yes;
          TASKS_RCU_GENERIC = yes;
          TASKS_RCU = yes;
          TASKS_RUDE_RCU = yes;
          TASKS_TRACE_RCU = yes;
          RCU_STALL_COMMON = yes;
          RCU_NEED_SEGCBLIST = yes;
          RCU_FANOUT = freeform "64";
          RCU_FANOUT_LEAF = freeform "16";
          RCU_BOOST = yes;
          RCU_BOOST_DELAY = freeform "500";
          RCU_NOCB_CPU = yes;
          RCU_LAZY = yes;
        };
      }
    ];

    supportedFilesystems = ["ntfs"];

    kernel.sysctl = {
      "kernel.sysrq" = mkDefault 1;
    };
  };
}
