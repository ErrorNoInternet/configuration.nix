{
  rum.desktops.hyprland = {
    settings = {
      "$mod" = "SUPER";

      binds = {
        allow_workspace_cycles = true;
      };

      dwindle = {
        preserve_split = true;
      };
    };

    extraConfig = ''
      bind    = $mod           , code:60, exec, noctalia-shell ipc call launcher emoji
      bind    = $mod           , comma  , exec, noctalia-shell ipc call settings toggle
      bind    = $mod           , D      , exec, noctalia-shell ipc call launcher toggle
      bind    = $mod           , escape , exec, noctalia-shell ipc call sessionMenu toggle
      bind    = $mod           , G      , exec, noctalia-shell ipc call launcher clipboard
      bind    = $mod           , O      , exec, noctalia-shell ipc call controlCenter toggle
      bind    = $mod           , P      , exec, noctalia-shell ipc call notifications toggleHistory
      bind    = $mod SHIFT     , O      , exec, noctalia-shell ipc call calendar toggle
      bind    = $mod SHIFT     , P      , exec, noctalia-shell ipc call notifications dismissAll

      bind    =                , PRINT,   exec, grimblast --freeze save area - | wl-copy
      bind    = CTRL           , PRINT,   exec, grimblast --freeze save area - | satty -f-
      bind    = CTRL SHIFT     , PRINT,   exec, grimblast --freeze save area - | shadower -r18 | satty -f-
      bind    = SHIFT          , PRINT,   exec, grimblast --freeze save area - | shadower -r18 | wl-copy

      bind    = $mod           , L                     , exec, loginctl lock-session
      bind    = $mod CTRL SHIFT, code:22               , exit
      bind    = $mod SHIFT     , L                     , exec, (sleep 1 && hyprctl dispatch dpms off &) && loginctl lock-session
      bindl   =                , switch:off:Lid Switch , exec, loginctl lock-session
      bindl   =                , switch:on:Lid Switch  , exec, loginctl lock-session

      bind    = $mod           , A, exec                   , scratchpad
      bind    = $mod           , S, togglespecialworkspace , scratchpad
      bind    = $mod           , W, togglespecialworkspace , communication
      bind    = $mod SHIFT     , A                         , exec, scratchpad -g -m "fuzzel -d"
      bind    = $mod SHIFT     , W, movetoworkspace        , special:communication

      bind    = $mod           , RETURN    , exec, kitty
      bind    = $mod SHIFT     , RETURN    , exec, [float; center] kitty
      bind    = $mod           , code:51   , exec, firefox
      bind    = $mod SHIFT     , code:51   , exec, [float; center] firefox

      bind    = $mod           , down , movefocus, d
      bind    = $mod           , left , movefocus, l
      bind    = $mod           , right, movefocus, r
      bind    = $mod           , up   , movefocus, u

      bind    = $mod           , F    , fullscreen, 1
      bind    = $mod           , Q    , killactive
      bind    = $mod           , T    , togglegroup
      bind    = $mod           , V    , togglefloating
      bind    = $mod           , Z    , togglesplit
      bind    = $mod CTRL      , F    , fullscreenstate, 0 2
      bind    = $mod SHIFT     , F    , fullscreen
      bind    = $mod SHIFT     , T    , lockactivegroup, toggle

      bind    = $mod CTRL      , left , changegroupactive, b
      bind    = $mod CTRL      , right, changegroupactive, f
      bind    = $mod CTRL SHIFT, down , movewindoworgroup, d
      bind    = $mod CTRL SHIFT, left , movewindoworgroup, l
      bind    = $mod CTRL SHIFT, right, movewindoworgroup, r
      bind    = $mod CTRL SHIFT, up   , movewindoworgroup, u

      bind    = $mod SHIFT     , down , movewindow, d
      bind    = $mod SHIFT     , left , movewindow, l
      bind    = $mod SHIFT     , right, movewindow, r
      bind    = $mod SHIFT     , up   , movewindow, u

      binde   = $mod ALT       , down , moveactive, 0 40
      binde   = $mod ALT       , left , moveactive, -40 0
      binde   = $mod ALT       , right, moveactive, 40 0
      binde   = $mod ALT       , up   , moveactive, 0 -40
      binde   = $mod ALT       , h    , moveactive, -40 0
      binde   = $mod ALT       , j    , moveactive, 0 40
      binde   = $mod ALT       , k    , moveactive, 0 -40
      binde   = $mod ALT       , l    , moveactive, 40 0

      bind    = $mod           , mouse_down                , workspace, e-1
      bind    = $mod           , mouse_up                  , workspace, e+1
      bindm   = $mod           , mouse:272                 , movewindow
      bindm   = $mod           , mouse:273                 , resizewindow

      bind    = $mod           , 1     , workspace         , 1
      bind    = $mod           , 2     , workspace         , 2
      bind    = $mod           , 3     , workspace         , 3
      bind    = $mod           , 4     , workspace         , 4
      bind    = $mod           , 5     , workspace         , 5
      bind    = $mod           , 6     , workspace         , 6
      bind    = $mod           , 7     , workspace         , 7
      bind    = $mod           , 8     , workspace         , 8
      bind    = $mod           , 9     , workspace         , 9
      bind    = $mod           , 0     , workspace         , 10
      bind    = $mod           , TAB   , workspace         , previous
      bind    = $mod SHIFT     , 1     , movetoworkspace   , 1
      bind    = $mod SHIFT     , 2     , movetoworkspace   , 2
      bind    = $mod SHIFT     , 3     , movetoworkspace   , 3
      bind    = $mod SHIFT     , 4     , movetoworkspace   , 4
      bind    = $mod SHIFT     , 5     , movetoworkspace   , 5
      bind    = $mod SHIFT     , 6     , movetoworkspace   , 6
      bind    = $mod SHIFT     , 7     , movetoworkspace   , 7
      bind    = $mod SHIFT     , 8     , movetoworkspace   , 8
      bind    = $mod SHIFT     , 9     , movetoworkspace   , 9
      bind    = $mod SHIFT     , 0     , movetoworkspace   , 10
      bind    = $mod SHIFT     , TAB   , movetoworkspace   , previous

      bindl   =                , XF86TouchpadToggle    , exec, hyprtoggle TOUCHPAD_ENABLED
      bindlr  =                , XF86DisplayOff        , exec, sleep 0.1 && hyprctl dispatch dpms

      bindl   =                , XF86Calculator        , exec, qalculate-gtk
      bindl   =                , XF86Launch1           , exec, kitty btop
      bindl   = $mod           , XF86Calculator        , exec, noctalia-shell ipc call launcher calculator
      bindl   = CTRL           , XF86Launch1           , exec, kitty nvtop
      bindl   = CTRL SHIFT     , XF86Launch1           , exec, [float; center] kitty nvtop
      bindl   = SHIFT          , XF86Launch1           , exec, [float; center] kitty btop

      bindl   =                , XF86AudioLowerVolume   , exec, noctalia-shell ipc call volume decrease
      bindl   =                , XF86AudioMicLowerVolume, exec, noctalia-shell ipc call volume decreaseInput
      bindl   =                , XF86AudioMicMute       , exec, noctalia-shell ipc call volume muteInput
      bindl   =                , XF86AudioMicRaiseVolume, exec, noctalia-shell ipc call volume increaseInput
      bindl   =                , XF86AudioMute          , exec, noctalia-shell ipc call volume muteOutput
      bindl   =                , XF86AudioNext          , exec, playerctl next
      bindl   =                , XF86AudioPlay          , exec, playerctl play
      bindl   =                , XF86AudioPrev          , exec, playerctl previous
      bindl   =                , XF86AudioRaiseVolume   , exec, noctalia-shell ipc call volume increase
      bindl   =                , XF86AudioStop          , exec, playerctl pause
      bindl   = $mod SHIFT     , m                      , exec, noctalia-shell ipc call volume muteInput

      bindle  =                , XF86KbdBrightnessDown , exec, brightnessctl -d asus::kbd_backlight s 1%-
      bindle  =                , XF86KbdBrightnessUp   , exec, brightnessctl -d asus::kbd_backlight s 1%+
      bindle  =                , XF86MonBrightnessDown , exec, noctalia-shell ipc call brightness decrease
      bindle  =                , XF86MonBrightnessUp   , exec, noctalia-shell ipc call brightness increase

      bind    = $mod CTRL SHIFT, escape, submap, clean
      submap  = clean
      bind    = $mod CTRL SHIFT, escape, submap, reset
      submap  = reset

      bind    = $mod, R,      submap,       resize
      submap  = resize
      binde   = CTRL      , left,   resizeactive, -40 0
      binde   = CTRL      , right,  resizeactive, 40 0
      binde   = CTRL      , up,     resizeactive, 0 -40
      binde   = CTRL      , down,   resizeactive, 0 40
      binde   = CTRL      , H,      resizeactive, -40 0
      binde   = CTRL      , L,      resizeactive, 40 0
      binde   = CTRL      , K,      resizeactive, 0 -40
      binde   = CTRL      , J,      resizeactive, 0 40
      binde   = SHIFT     , left,   resizeactive, 40 0
      binde   = SHIFT     , left,   moveactive,   -40 0
      binde   = SHIFT     , right,  resizeactive, -40 0
      binde   = SHIFT     , right,  moveactive,   40 0
      binde   = SHIFT     , up,     resizeactive, 0 40
      binde   = SHIFT     , up,     moveactive  , 0 -40
      binde   = SHIFT     , down,   resizeactive, 0 -40
      binde   = SHIFT     , down,   moveactive,   0 40
      binde   = SHIFT     , H,      resizeactive, 40 0
      binde   = SHIFT     , H,      moveactive,   -40 0
      binde   = SHIFT     , L,      resizeactive, -40 0
      binde   = SHIFT     , L,      moveactive,   40 0
      binde   = SHIFT     , K,      resizeactive, 0 40
      binde   = SHIFT     , K,      moveactive  , 0 -40
      binde   = SHIFT     , J,      resizeactive, 0 -40
      binde   = SHIFT     , J,      moveactive,   0 40
      binde   =           , left,   resizeactive, -40 0
      binde   =           , left,   moveactive,   20 0
      binde   =           , right,  resizeactive, 40 0
      binde   =           , right,  moveactive,   -20 0
      binde   =           , up,     resizeactive, 0 -40
      binde   =           , up,     moveactive  , 0 20
      binde   =           , down,   resizeactive, 0 40
      binde   =           , down,   moveactive,   0 -20
      binde   =           , H,      resizeactive, -40 0
      binde   =           , H,      moveactive,   20 0
      binde   =           , L,      resizeactive, 40 0
      binde   =           , L,      moveactive,   -20 0
      binde   =           , K,      resizeactive, 0 -40
      binde   =           , K,      moveactive  , 0 20
      binde   =           , J,      resizeactive, 0 40
      binde   =           , J,      moveactive,   0 -20
      binde   = ALT       , down , moveactive, 0 40
      binde   = ALT       , left , moveactive, -40 0
      binde   = ALT       , right, moveactive, 40 0
      binde   = ALT       , up   , moveactive, 0 -40
      binde   = ALT       , h    , moveactive, -40 0
      binde   = ALT       , j    , moveactive, 0 40
      binde   = ALT       , k    , moveactive, 0 -40
      binde   = ALT       , l    , moveactive, 40 0
      bind    =     , escape, submap,       reset
      bind    = $mod, R,      submap,       reset
      submap  = reset
    '';
  };
}
