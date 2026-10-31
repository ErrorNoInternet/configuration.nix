local mod = "SUPER"

hl.config({
    binds = {
        allow_workspace_cycles = true,
    },

    dwindle = {
        preserve_split = true,
    },
})

local function bind(mods, key, dispatcher, flags)
    local mask = table.concat(mods, " + ")
    hl.bind(mask == "" and key or (mask .. " + " .. key), dispatcher, flags)
end

bind({ mod }, "comma", hl.dsp.exec_cmd("noctalia msg settings-toggle"))
bind({ mod }, "D", hl.dsp.exec_cmd("noctalia msg panel-toggle launcher"))
bind({ mod }, "escape", hl.dsp.exec_cmd("noctalia msg panel-toggle session"))
bind({ mod }, "V", hl.dsp.exec_cmd("noctalia msg panel-toggle clipboard"))
bind({ mod }, "O", hl.dsp.exec_cmd("noctalia msg panel-toggle control-center"))
bind({ mod }, "P", hl.dsp.exec_cmd("noctalia msg panel-toggle control-center notifications"))
bind({ mod }, "period", hl.dsp.exec_cmd("noctalia msg panel-toggle launcher /emo"))
bind({ mod }, "slash", hl.dsp.exec_cmd("noctalia msg panel-toggle launcher /"))
bind({ mod, "SHIFT" }, "O", hl.dsp.exec_cmd("noctalia msg panel-toggle control-center calendar"))
bind({ mod, "SHIFT" }, "P", hl.dsp.exec_cmd("noctalia msg notification-clear-active"))

bind({}, "PRINT", hl.dsp.exec_cmd("noctalia msg screenshot-region"))
bind({}, "XF86SelectiveScreenshot", hl.dsp.exec_cmd("grimblast --freeze save area - | wl-copy"))
bind({ "CTRL" }, "PRINT", hl.dsp.exec_cmd("noctalia msg screenshot-annotate"))
bind({ "CTRL" }, "XF86SelectiveScreenshot", hl.dsp.exec_cmd("grimblast --freeze save area - | satty -f-"))

bind({ mod }, "L", hl.dsp.exec_cmd("loginctl lock-session"))
bind({ mod, "CTRL", "SHIFT" }, "code:22", hl.dsp.exit())
bind({ mod, "SHIFT" }, "L", hl.dsp.exec_cmd("(sleep 1 && noctalia msg dpms-off &) && loginctl lock-session"))
bind({}, "switch:off:Lid Switch", hl.dsp.exec_cmd("loginctl lock-session"), { locked = true })
bind({}, "switch:on:Lid Switch", hl.dsp.exec_cmd("loginctl lock-session"), { locked = true })

bind({ mod }, "A", hl.dsp.exec_cmd('scratchpad -g -l -m "fuzzel -d"'))
bind({ mod }, "E", hl.dsp.workspace.toggle_special("inbox"))
bind({ mod }, "S", hl.dsp.workspace.toggle_special("scratchpad"))
bind({ mod }, "W", hl.dsp.workspace.toggle_special("communication"))
bind({ mod, "SHIFT" }, "A", hl.dsp.exec_cmd("scratchpad"))
bind({ mod, "SHIFT" }, "E", hl.dsp.window.move({ workspace = "special:inbox" }))
bind({ mod, "SHIFT" }, "W", hl.dsp.window.move({ workspace = "special:communication" }))

bind({ mod }, "RETURN", hl.dsp.exec_cmd("kitty"))
bind({ mod, "SHIFT" }, "RETURN", hl.dsp.exec_cmd("kitty", { float = true, center = true }))
bind({ mod }, "code:51", hl.dsp.exec_cmd("firefox"))
bind({ mod, "SHIFT" }, "code:51", hl.dsp.exec_cmd("firefox", { float = true, center = true }))

bind({ mod }, "down", hl.dsp.focus({ direction = "down" }))
bind({ mod }, "left", hl.dsp.focus({ direction = "left" }))
bind({ mod }, "right", hl.dsp.focus({ direction = "right" }))
bind({ mod }, "up", hl.dsp.focus({ direction = "up" }))

bind({ mod }, "F", hl.dsp.window.fullscreen({ mode = "maximized" }))
bind({ mod }, "Q", hl.dsp.window.close())
bind({ mod }, "T", hl.dsp.group.toggle())
bind({ mod }, "X", hl.dsp.window.float({ action = "toggle" }))
bind({ mod }, "Z", hl.dsp.layout("togglesplit"))
bind({ mod, "CTRL" }, "F", hl.dsp.window.fullscreen_state({ internal = 0, client = 2, action = "toggle" }))
bind({ mod, "SHIFT" }, "F", hl.dsp.window.fullscreen({ mode = "fullscreen" }))
bind({ mod, "SHIFT" }, "T", hl.dsp.group.lock({ action = "toggle" }))

bind({ mod, "CTRL" }, "left", hl.dsp.group.prev())
bind({ mod, "CTRL" }, "right", hl.dsp.group.next())
bind({ mod, "CTRL", "SHIFT" }, "down", hl.dsp.window.move({ direction = "down", group_aware = true }))
bind({ mod, "CTRL", "SHIFT" }, "left", hl.dsp.window.move({ direction = "left", group_aware = true }))
bind({ mod, "CTRL", "SHIFT" }, "right", hl.dsp.window.move({ direction = "right", group_aware = true }))
bind({ mod, "CTRL", "SHIFT" }, "up", hl.dsp.window.move({ direction = "up", group_aware = true }))

bind({ mod, "SHIFT" }, "down", hl.dsp.window.move({ direction = "down" }))
bind({ mod, "SHIFT" }, "left", hl.dsp.window.move({ direction = "left" }))
bind({ mod, "SHIFT" }, "right", hl.dsp.window.move({ direction = "right" }))
bind({ mod, "SHIFT" }, "up", hl.dsp.window.move({ direction = "up" }))

local move_offsets = {
    { key = "down", x = 0, y = 40 },
    { key = "left", x = -40, y = 0 },
    { key = "right", x = 40, y = 0 },
    { key = "up", x = 0, y = -40 },
    { key = "h", x = -40, y = 0 },
    { key = "j", x = 0, y = 40 },
    { key = "k", x = 0, y = -40 },
    { key = "l", x = 40, y = 0 },
}
for _, offset in ipairs(move_offsets) do
    bind({ mod, "ALT" }, offset.key, hl.dsp.window.move({ x = offset.x, y = offset.y, relative = true }), { repeating = true })
end

bind({ mod }, "mouse_down", hl.dsp.focus({ workspace = "e+1" }))
bind({ mod }, "mouse_up", hl.dsp.focus({ workspace = "e-1" }))
bind({ mod, "CTRL" }, "mouse_down", hl.dsp.focus({ workspace = "r+1" }))
bind({ mod, "CTRL" }, "mouse_up", hl.dsp.focus({ workspace = "r-1" }))
bind({ mod, "CTRL", "SHIFT" }, "mouse_down", hl.dsp.window.move({ workspace = "r+1" }))
bind({ mod, "CTRL", "SHIFT" }, "mouse_up", hl.dsp.window.move({ workspace = "r-1" }))
bind({ mod, "SHIFT" }, "mouse_down", hl.dsp.window.move({ workspace = "e+1" }))
bind({ mod, "SHIFT" }, "mouse_up", hl.dsp.window.move({ workspace = "e-1" }))
bind({ mod }, "mouse:272", hl.dsp.window.drag(), { mouse = true })
bind({ mod }, "mouse:273", hl.dsp.window.resize(), { mouse = true })

for i = 1, 10 do
    local key = i % 10
    bind({ mod }, key, hl.dsp.focus({ workspace = i }))
    bind({ mod, "SHIFT" }, key, hl.dsp.window.move({ workspace = i }))
end
bind({ mod }, "mouse:274", hl.dsp.focus({ workspace = "previous" }))
bind({ mod }, "mouse:275", hl.dsp.focus({ workspace = 10 }))
bind({ mod }, "mouse:276", hl.dsp.focus({ workspace = 9 }))
bind({ mod }, "TAB", hl.dsp.focus({ workspace = "previous" }))
bind({ mod, "SHIFT" }, "mouse:274", hl.dsp.window.move({ workspace = "previous" }))
bind({ mod, "SHIFT" }, "mouse:275", hl.dsp.window.move({ workspace = 10 }))
bind({ mod, "SHIFT" }, "mouse:276", hl.dsp.window.move({ workspace = 9 }))
bind({ mod, "SHIFT" }, "TAB", hl.dsp.window.move({ workspace = "previous" }))

bind({}, "XF86DisplayOff", hl.dsp.exec_cmd("sleep 0.1 && noctalia msg dpms-on"), { locked = true, release = true })
bind({}, "XF86Calculator", hl.dsp.exec_cmd("qalculate-gtk"), { locked = true })

local float_center = { float = true, center = true }
local monitor_binds = {
    { key = "XF86Favorites", cmd = "kitty btop" },
    { key = "XF86Launch1", cmd = "kitty btop" },
    { mods = { "CTRL" }, key = "XF86Favorites", cmd = "kitty nvtop" },
    { mods = { "CTRL" }, key = "XF86Launch1", cmd = "kitty nvtop" },
    { mods = { "CTRL", "SHIFT" }, key = "XF86Favorites", cmd = "kitty nvtop", rules = float_center },
    { mods = { "CTRL", "SHIFT" }, key = "XF86Launch1", cmd = "kitty nvtop", rules = float_center },
    { mods = { "SHIFT" }, key = "XF86Favorites", cmd = "kitty btop", rules = float_center },
    { mods = { "SHIFT" }, key = "XF86Launch1", cmd = "kitty btop", rules = float_center },
}
for _, b in ipairs(monitor_binds) do
    bind(b.mods or {}, b.key, hl.dsp.exec_cmd(b.cmd, b.rules), { locked = true })
end

bind({ "SHIFT" }, "XF86AudioLowerVolume", hl.dsp.exec_cmd("noctalia msg mic-volume-down"), { locked = true })
bind({ "SHIFT" }, "XF86AudioMute", hl.dsp.exec_cmd("noctalia msg mic-mute"), { locked = true })
bind({ "SHIFT" }, "XF86AudioRaiseVolume", hl.dsp.exec_cmd("noctalia msg mic-volume-up"), { locked = true })
bind({}, "XF86AudioLowerVolume", hl.dsp.exec_cmd("noctalia msg volume-down"), { locked = true })
bind({}, "XF86AudioMicMute", hl.dsp.exec_cmd("noctalia msg mic-mute"), { locked = true })
bind({}, "XF86AudioMute", hl.dsp.exec_cmd("noctalia msg volume-mute"), { locked = true })
bind({}, "XF86AudioNext", hl.dsp.exec_cmd("playerctl next"), { locked = true })
bind({}, "XF86AudioPlay", hl.dsp.exec_cmd("playerctl play"), { locked = true })
bind({}, "XF86AudioPrev", hl.dsp.exec_cmd("playerctl previous"), { locked = true })
bind({}, "XF86AudioRaiseVolume", hl.dsp.exec_cmd("noctalia msg volume-up"), { locked = true })
bind({}, "XF86AudioStop", hl.dsp.exec_cmd("playerctl pause"), { locked = true })
bind({ mod, "SHIFT" }, "m", hl.dsp.exec_cmd("noctalia msg mic-mute"))

bind({}, "XF86KbdBrightnessDown", hl.dsp.exec_cmd("noctalia msg keyboard-backlight-down"), { locked = true, repeating = true })
bind({}, "XF86KbdBrightnessUp", hl.dsp.exec_cmd("noctalia msg keyboard-backlight-up"), { locked = true, repeating = true })
bind({}, "XF86MonBrightnessDown", hl.dsp.exec_cmd("noctalia msg brightness-down 1"), { locked = true, repeating = true })
bind({}, "XF86MonBrightnessUp", hl.dsp.exec_cmd("noctalia msg brightness-up 1"), { locked = true, repeating = true })

bind({ mod, "CTRL", "SHIFT" }, "escape", hl.dsp.submap("clean"))
hl.define_submap("clean", function()
    bind({ mod, "CTRL", "SHIFT" }, "escape", hl.dsp.submap("reset"))
end)

bind({ mod }, "R", hl.dsp.submap("resize"))
hl.define_submap("resize", function()
    local resize_offsets = {
        { key = "left", x = -40, y = 0 },
        { key = "right", x = 40, y = 0 },
        { key = "up", x = 0, y = -40 },
        { key = "down", x = 0, y = 40 },
        { key = "h", x = -40, y = 0 },
        { key = "l", x = 40, y = 0 },
        { key = "k", x = 0, y = -40 },
        { key = "j", x = 0, y = 40 },
    }
    for _, offset in ipairs(resize_offsets) do
        bind({}, offset.key, hl.dsp.window.resize({ x = offset.x, y = offset.y, relative = true }), { repeating = true })
    end

    local move_offsets = {
        { mods = { "ALT" }, key = "down", x = 0, y = 40 },
        { mods = { "ALT" }, key = "left", x = -40, y = 0 },
        { mods = { "ALT" }, key = "right", x = 40, y = 0 },
        { mods = { "ALT" }, key = "up", x = 0, y = -40 },
        { mods = { "ALT" }, key = "h", x = -40, y = 0 },
        { mods = { "ALT" }, key = "j", x = 0, y = 40 },
        { mods = { "ALT" }, key = "k", x = 0, y = -40 },
        { mods = { "ALT" }, key = "l", x = 40, y = 0 },
    }
    for _, offset in ipairs(move_offsets) do
        bind(offset.mods, offset.key, hl.dsp.window.move({ x = offset.x, y = offset.y, relative = true }), { repeating = true })
    end

    bind({}, "escape", hl.dsp.submap("reset"))
    bind({ mod }, "R", hl.dsp.submap("reset"))
end)
