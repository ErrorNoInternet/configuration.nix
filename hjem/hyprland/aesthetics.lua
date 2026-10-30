local colors = require("colors")

hl.curve("extremeEaseOut", { type = "bezier", points = { { 0, 1 }, { 0, 1 } } })
hl.curve("ease",           { type = "bezier", points = { { 0.32, 0 }, { 0.15, 1 } } })

hl.animation({ leaf = "fade",             enabled = true, speed = 3, bezier = "default" })
hl.animation({ leaf = "fadeDpms",         enabled = true, speed = 6, bezier = "ease" })
hl.animation({ leaf = "layers",           enabled = true, speed = 3, bezier = "extremeEaseOut", style = "popin 50%" })
hl.animation({ leaf = "layersOut",        enabled = true, speed = 3, bezier = "extremeEaseOut", style = "popin 75%" })
hl.animation({ leaf = "windows",          enabled = true, speed = 3, bezier = "extremeEaseOut", style = "popin 50%" })
hl.animation({ leaf = "windowsOut",       enabled = true, speed = 3, bezier = "default",        style = "popin 75%" })
hl.animation({ leaf = "workspaces",       enabled = true, speed = 2, bezier = "extremeEaseOut", style = "slidefade 50%" })
hl.animation({ leaf = "specialWorkspace", enabled = true, speed = 2, bezier = "extremeEaseOut", style = "slidefadevert -50%" })

hl.config({
    ecosystem = {
        no_update_news = true,
        no_donation_nag = true,
    },

    decoration = {
        rounding = 12,
        rounding_power = 4,

        blur = {
            passes = 3,
            size = 8,
            popups = true,
            popups_ignorealpha = 0.65,
            input_methods = true,
            input_methods_ignorealpha = 0.4,
        },

        shadow = {
            enabled = true,
            range = 25,
            render_power = 3,
            color = colors.base00,
        },
    },

    misc = {
        animate_manual_resizes = true,
        animate_mouse_windowdragging = true,
        disable_hyprland_logo = true,
        disable_splash_rendering = true,
        disable_xdg_env_checks = true,
        enable_anr_dialog = false,
        render_unfocused_fps = 60,
    },

    group = {
        col = {
            border_active = colors.base05,
            border_inactive = colors.base03,
            border_locked_active = colors.base04,
            border_locked_inactive = colors.base03,
        },

        groupbar = {
            indicator_height = 4,
            render_titles = false,
            rounding = 2,
            col = {
                active = colors.base05,
                inactive = colors.base03,
                locked_active = colors.base04,
                locked_inactive = colors.base03,
            },
        },
    },

    general = {
        border_size = 2,
        gaps_in = 4,
        gaps_out = 8,
        col = {
            active_border = colors.base05,
            inactive_border = colors.base03,
        },
    },
})
