{
  lib,
  system,
  wezterm,
  ...
}:
wezterm.overrideAttrs (old: {
  patches =
    (old.patches or [])
    ++ [
      ./optimize-build.patch
      ./remove-first-configure.patch
      ./remove-set-cursor.patch
    ]
    ++ lib.optional (system == "x86_64-linux") ./optimize-x86-64-build.patch;
})
