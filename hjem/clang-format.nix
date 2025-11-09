{ lib, osConfig, ... }:
{
  xdg.config.files = lib.mkIf osConfig.development.enable {
    "clang-format".text = ''
      BasedOnStyle: LLVM
      IndentWidth: 4
    '';
  };
}
