{ lib, osConfig, ... }:
{
  xdg.config.files = lib.mkIf osConfig.development.enable {
    "gdb/gdbearlyinit".text = ''
      set startup-quietly on
    '';

    "gdb/gdbinit".text = ''
      set disassembly-flavor intel
      set debuginfod enabled off
    '';
  };
}
