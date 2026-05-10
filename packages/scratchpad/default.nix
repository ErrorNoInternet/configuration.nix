{ inputs', ... }:
inputs'.hyprwm-contrib.packages.scratchpad.overrideAttrs (old: {
  patches = (old.patches or [ ]) ++ [
    ./better-notifications.patch
    ./fix-grammar.patch
    ./hide-rofi-icons.patch
  ];
})
