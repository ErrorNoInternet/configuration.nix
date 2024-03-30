{
  host,
  kitty,
  self,
  ...
}:
with self.lib.derivations;
  optimizeArchitecture host
  (optimizeLto (kitty.overrideAttrs (old: {
    patches =
      (old.patches or [])
      ++ [
        ./parse-base10-rgb.patch
        ./remove-resize-text.patch
        ./thicker-braille-dots.patch
      ];
  })))
