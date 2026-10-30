local values = require("values")

hl.config({
    gestures = {
        workspace_swipe_cancel_ratio = 0.2,
        workspace_swipe_forever = true,
        workspace_swipe_min_speed_to_force = 10,
    },

    input = {
        touchpad = {
            disable_while_typing = false,
            natural_scroll = true,
        },
        accel_profile = "flat",
        repeat_delay = values.repeat_delay,
        repeat_rate = values.repeat_rate,
    },

    misc = {
        key_press_enables_dpms = true,
        mouse_move_enables_dpms = true,
    },
})

hl.gesture({ fingers = 3, direction = "horizontal", action = "workspace" })
hl.gesture({ fingers = 4, direction = "horizontal", action = "move" })
hl.gesture({ fingers = 3, direction = "vertical", action = "special", workspace_name = "scratchpad" })
hl.gesture({ fingers = 4, direction = "vertical", action = "special", workspace_name = "communication" })

