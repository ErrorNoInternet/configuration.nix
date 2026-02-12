{
  rum.desktops.hyprland.settings = {
    gestures = {
      workspace_swipe_cancel_ratio = 0.2;
      workspace_swipe_forever = true;
      workspace_swipe_min_speed_to_force = 10;
    };

    gesture = [
      "3, horizontal, workspace"
      "4, horizontal, move"
      "3, vertical, special, scratchpad"
      "4, vertical, special, communication"
    ];

    input = {
      touchpad = {
        disable_while_typing = false;
        natural_scroll = true;
      };
      accel_profile = "flat";
      repeat_delay = 150;
      repeat_rate = 50;
    };

    misc = {
      key_press_enables_dpms = true;
      mouse_move_enables_dpms = true;
    };

    "$TOUCHPAD_ENABLED" = true;
    device = {
      name = "elan1200:00-04f3:301a-touchpad";
      enabled = "$TOUCHPAD_ENABLED";
    };
  };
}
