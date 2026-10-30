local function mk_rules(add_rule, rule_sets)
    for _, set in ipairs(rule_sets) do
        local rule = { match = set.match }
        for effect, value in pairs(set.rules) do
            rule[effect] = value
        end
        add_rule(rule)
    end
end

local window_rule_sets = {
    { match = { class = "lowfi" }, rules = { size = "306 82", center = true, float = true } },
    { match = { class = "qalculate-gtk" }, rules = { size = "720 540", float = true } },
    { match = { class = "kitty" }, rules = { size = "monitor_w*0.6 monitor_h*0.6" } },
    { match = { class = "org.mozilla.firefox" }, rules = { size = "monitor_w*0.6 monitor_h*0.6" } },
    { match = { class = "org.pulseaudio.pavucontrol" }, rules = { float = true, size = "monitor_w*0.6 monitor_h*0.6" } },
    { match = { class = "com.saivert.pwvucontrol" }, rules = { float = true, size = "monitor_w*0.6 monitor_h*0.6" } },

    { match = { class = "blueman-manager" }, rules = { animation = "slide", center = true, float = true, size = "monitor_w*0.6 monitor_h*0.65" } },
    { match = { class = "xdg-desktop-portal-gtk" }, rules = { animation = "slide", center = true, float = true, size = "monitor_w*0.6 monitor_h*0.65" } },
    { match = { title = "Select what to share" }, rules = { animation = "slide", center = true, float = true, size = "monitor_w*0.3 monitor_h*0.3" } },

    { match = { class = "jetbrains-(.*)", title = "^win(.*)" }, rules = { no_initial_focus = true } },
    { match = { class = "branchdialog" }, rules = { float = true } },
    { match = { class = "confirm" }, rules = { float = true } },
    { match = { class = "dialog" }, rules = { float = true } },
    { match = { class = "error" }, rules = { float = true } },
    { match = { class = "mpv" }, rules = { float = true } },
    { match = { class = "notification" }, rules = { float = true } },
    { match = { class = "org.kde.kdeconnect.daemon" }, rules = { float = true } },
    { match = { class = "vimiv" }, rules = { float = true } },

    { match = { title = "Steam Big Picture Mode" }, rules = { render_unfocused = true } },
}

local layer_rule_sets = {
    { match = { namespace = "hyprpicker" }, rules = { no_anim = true } },
    { match = { namespace = "selection" }, rules = { no_anim = true } },
    { match = { namespace = "noctalia-screenshot-region" }, rules = { animation = "fade" } },
    { match = { namespace = "noctalia-bar-default" }, rules = { blur = true, ignore_alpha = 0.7 } },
    { match = { namespace = "noctalia-attached-panel" }, rules = { blur = true, ignore_alpha = 0.7 } },
}

mk_rules(function(rule)
    hl.window_rule(rule)
end, window_rule_sets)

mk_rules(function(rule)
    hl.layer_rule(rule)
end, layer_rule_sets)
