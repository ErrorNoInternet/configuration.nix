{
  pkgs,
  ...
}:
pkgs.kitty.overrideAttrs (old: {
  patches = (old.patches or [ ]) ++ [
    ./bell-tab-title-env.diff
    ./shade-transparency.diff
  ];
})
