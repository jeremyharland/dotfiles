-- Keybindings
-- https://wiki.hypr.land/Configuring/Basics/Binds/

local mainMod = "SUPER"
local scrPath = os.getenv("HOME") .. "/.config/hypr/scripts"

local term    = "ghostty"
local editor  = "code --ozone-platform-hint=wayland --disable-gpu"
local file    = "dolphin"
local browser = "firefox"

-- Window / session actions
hl.bind(mainMod .. " + Q",             hl.dsp.exec_cmd(scrPath .. "/dontkillsteam.sh"))
hl.bind("ALT + F4",                    hl.dsp.exec_cmd(scrPath .. "/dontkillsteam.sh"))
hl.bind(mainMod .. " + delete",        hl.dsp.exit())
hl.bind(mainMod .. " + W",             hl.dsp.window.float({ action = "toggle" }))
hl.bind(mainMod .. " + G",             hl.dsp.group.toggle())
hl.bind("ALT + return",                hl.dsp.window.fullscreen({ action = "toggle" }))
hl.bind(mainMod .. " + L",             hl.dsp.exec_cmd("swaylock"))
hl.bind(mainMod .. " + SHIFT + F",     hl.dsp.exec_cmd(scrPath .. "/windowpin.sh"))
hl.bind(mainMod .. " + backspace",     hl.dsp.exec_cmd(scrPath .. "/logoutlaunch.sh 1"))
hl.bind("CTRL + ESCAPE",               hl.dsp.exec_cmd("killall waybar || waybar"))
hl.bind(mainMod .. " + ALT + F",       hl.dsp.exec_cmd(browser .. " -P Mosh"))

-- Application shortcuts
hl.bind(mainMod .. " + T",             hl.dsp.exec_cmd(term))
hl.bind(mainMod .. " + E",             hl.dsp.exec_cmd(file))
hl.bind(mainMod .. " + C",             hl.dsp.exec_cmd(editor))
hl.bind(mainMod .. " + F",             hl.dsp.exec_cmd(browser))
hl.bind("CTRL + SHIFT + ESCAPE",       hl.dsp.exec_cmd(scrPath .. "/sysmonlaunch.sh"))
hl.bind("CTRL + SHIFT + Space",        hl.dsp.exec_cmd("1password --quick-access"))
hl.bind(mainMod .. " + ALT + V",       hl.dsp.exec_cmd(scrPath .. "/togglemullvad.sh"))

-- Rofi (toggled on/off if key is repeated)
hl.bind(mainMod .. " + A",             hl.dsp.exec_cmd("pkill -x rofi || " .. scrPath .. "/rofilaunch.sh d"))
hl.bind(mainMod .. " + Tab",           hl.dsp.exec_cmd("pkill -x rofi || " .. scrPath .. "/rofilaunch.sh w"))
hl.bind(mainMod .. " + R",             hl.dsp.exec_cmd("pkill -x rofi || " .. scrPath .. "/rofilaunch.sh f"))

-- Audio control
hl.bind("F10",                         hl.dsp.exec_cmd(scrPath .. "/volumecontrol.sh -o m"),   { locked = true })
hl.bind("F11",                         hl.dsp.exec_cmd(scrPath .. "/volumecontrol.sh -o d"),   { locked = true, repeating = true })
hl.bind("F12",                         hl.dsp.exec_cmd(scrPath .. "/volumecontrol.sh -o i"),   { locked = true, repeating = true })
hl.bind("XF86AudioMute",               hl.dsp.exec_cmd(scrPath .. "/volumecontrol.sh -o m"),   { locked = true })
hl.bind("XF86AudioMicMute",            hl.dsp.exec_cmd(scrPath .. "/volumecontrol.sh -i m"),   { locked = true })
hl.bind("XF86AudioLowerVolume",        hl.dsp.exec_cmd(scrPath .. "/volumecontrol.sh -o d"),   { locked = true, repeating = true })
hl.bind("XF86AudioRaiseVolume",        hl.dsp.exec_cmd(scrPath .. "/volumecontrol.sh -o i"),   { locked = true, repeating = true })
hl.bind("XF86AudioPlay",               hl.dsp.exec_cmd("playerctl play-pause"),                { locked = true })
hl.bind("XF86AudioPause",              hl.dsp.exec_cmd("playerctl play-pause"),                { locked = true })
hl.bind("XF86AudioNext",               hl.dsp.exec_cmd("playerctl next"),                      { locked = true })
hl.bind("XF86AudioPrev",               hl.dsp.exec_cmd("playerctl previous"),                  { locked = true })

-- Brightness control
hl.bind("XF86MonBrightnessUp",         hl.dsp.exec_cmd(scrPath .. "/brightnesscontrol.sh i"),  { locked = true, repeating = true })
hl.bind("XF86MonBrightnessDown",       hl.dsp.exec_cmd(scrPath .. "/brightnesscontrol.sh d"),  { locked = true, repeating = true })

-- Screenshot
hl.bind(mainMod .. " + P",             hl.dsp.exec_cmd(scrPath .. "/screenshot.sh s"))
hl.bind(mainMod .. " + CTRL + P",      hl.dsp.exec_cmd(scrPath .. "/screenshot.sh sf"))
hl.bind(mainMod .. " + ALT + P",       hl.dsp.exec_cmd(scrPath .. "/screenshot.sh m"))
hl.bind("Print",                       hl.dsp.exec_cmd(scrPath .. "/screenshot.sh p"))

-- Custom scripts
hl.bind(mainMod .. " + ALT + G",       hl.dsp.exec_cmd(scrPath .. "/gamemode.sh"))
hl.bind(mainMod .. " + ALT + right",   hl.dsp.exec_cmd(scrPath .. "/swwwallpaper.sh -n"))
hl.bind(mainMod .. " + ALT + left",    hl.dsp.exec_cmd(scrPath .. "/swwwallpaper.sh -p"))
hl.bind(mainMod .. " + ALT + up",      hl.dsp.exec_cmd(scrPath .. "/wbarconfgen.sh n"))
hl.bind(mainMod .. " + ALT + down",    hl.dsp.exec_cmd(scrPath .. "/wbarconfgen.sh p"))
hl.bind(mainMod .. " + SHIFT + D",     hl.dsp.exec_cmd(scrPath .. "/wallbashtoggle.sh"))
hl.bind(mainMod .. " + SHIFT + T",     hl.dsp.exec_cmd("pkill -x rofi || " .. scrPath .. "/themeselect.sh"))
hl.bind(mainMod .. " + SHIFT + A",     hl.dsp.exec_cmd("pkill -x rofi || " .. scrPath .. "/rofiselect.sh"))
hl.bind(mainMod .. " + SHIFT + W",     hl.dsp.exec_cmd("pkill -x rofi || " .. scrPath .. "/swwwallselect.sh"))
hl.bind(mainMod .. " + V",             hl.dsp.exec_cmd("pkill -x rofi || " .. scrPath .. "/cliphist.sh c"))
hl.bind(mainMod .. " + K",             hl.dsp.exec_cmd(scrPath .. "/keyboardswitch.sh"))
hl.bind(mainMod .. " + SHIFT + E",     hl.dsp.exec_cmd(scrPath .. "/followmouseoff.sh"))
hl.bind(mainMod .. " + SHIFT + E",     hl.dsp.exec_cmd(scrPath .. "/followmouseon.sh"),        { release = true })
hl.bind(mainMod .. " + F10",           hl.dsp.exec_cmd(scrPath .. "/toggle-monitor.sh"))

-- Move focus
hl.bind(mainMod .. " + left",          hl.dsp.focus({ direction = "left" }))
hl.bind(mainMod .. " + right",         hl.dsp.focus({ direction = "right" }))
hl.bind(mainMod .. " + up",            hl.dsp.focus({ direction = "up" }))
hl.bind(mainMod .. " + down",          hl.dsp.focus({ direction = "down" }))
hl.bind("ALT + Tab",                   hl.dsp.focus({ direction = "down" }))

-- Switch workspaces and move windows
for i = 1, 10 do
    local key = i % 10
    hl.bind(mainMod .. " + " .. key,                      hl.dsp.focus({ workspace = i }))
    hl.bind(mainMod .. " + SHIFT + " .. key,              hl.dsp.window.move({ workspace = i }))
    hl.bind(mainMod .. " + ALT + " .. key,                hl.dsp.window.move({ workspace = i, follow = false }))
end

-- Relative workspace navigation
hl.bind(mainMod .. " + CTRL + right",  hl.dsp.focus({ workspace = "r+1" }))
hl.bind(mainMod .. " + CTRL + left",   hl.dsp.focus({ workspace = "r-1" }))
hl.bind(mainMod .. " + CTRL + down",   hl.dsp.focus({ workspace = "empty" }))

-- Move window to relative workspace
hl.bind(mainMod .. " + CTRL + ALT + right", hl.dsp.window.move({ workspace = "r+1" }))
hl.bind(mainMod .. " + CTRL + ALT + left",  hl.dsp.window.move({ workspace = "r-1" }))

-- Resize windows
hl.bind(mainMod .. " + SHIFT + right", hl.dsp.window.resize({ x = 30,  y = 0,   relative = true }), { repeating = true })
hl.bind(mainMod .. " + SHIFT + left",  hl.dsp.window.resize({ x = -30, y = 0,   relative = true }), { repeating = true })
hl.bind(mainMod .. " + SHIFT + up",    hl.dsp.window.resize({ x = 0,   y = -30, relative = true }), { repeating = true })
hl.bind(mainMod .. " + SHIFT + down",  hl.dsp.window.resize({ x = 0,   y = 30,  relative = true }), { repeating = true })

-- Move active window around workspace
hl.bind(mainMod .. " + SHIFT + CTRL + left",  hl.dsp.window.move({ direction = "left" }))
hl.bind(mainMod .. " + SHIFT + CTRL + right", hl.dsp.window.move({ direction = "right" }))
hl.bind(mainMod .. " + SHIFT + CTRL + up",    hl.dsp.window.move({ direction = "up" }))
hl.bind(mainMod .. " + SHIFT + CTRL + down",  hl.dsp.window.move({ direction = "down" }))

-- Scroll through workspaces
hl.bind(mainMod .. " + mouse_down",    hl.dsp.focus({ workspace = "e+1" }))
hl.bind(mainMod .. " + mouse_up",      hl.dsp.focus({ workspace = "e-1" }))

-- Move/resize with mouse
hl.bind(mainMod .. " + mouse:272",     hl.dsp.window.drag(),   { mouse = true })
hl.bind(mainMod .. " + mouse:273",     hl.dsp.window.resize(), { mouse = true })

-- Special workspace (scratchpad)
hl.bind(mainMod .. " + ALT + S",       hl.dsp.window.move({ workspace = "special", follow = false }))
hl.bind(mainMod .. " + S",             hl.dsp.workspace.toggle_special(""))

-- Toggle layout
hl.bind(mainMod .. " + J",             hl.dsp.layout("togglesplit"))

-- Lid switch
hl.bind("switch:on:Lid Switch",        hl.dsp.exec_cmd("swaylock && systemctl suspend"), { locked = true })
