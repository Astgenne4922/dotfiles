local terminal = "kitty"
local filemanager = "kitty -- yazi"
local menu = "~/.config/rofi/launcher/launcher.sh"
local keybindhelp = "~/.config/rofi/launcher/keybinds.sh"
local browser = "firefox"
local editor = "kitty -- nvim"


--HELP SUPER + SHIFT + Q           | Kill active window
hl.bind("SUPER + SHIFT + Q", hl.dsp.window.close())

--HELP SUPER + ALT + E             | Quit Hyprland session
hl.bind("SUPER + ALT + E", hl.dsp.exit())

--HELP SUPER + ENTER               | Open terminal
hl.bind("SUPER + Return", hl.dsp.exec_cmd(terminal))

--HELP SUPER + SHIFT + ENTER       | Open floating terminal
hl.bind("SUPER + SHIFT + Return", hl.dsp.exec_cmd(terminal, { float = true, size = { "50%", "50%" } }))

--HELP SUPER + ALT + SPACE         | Open rofi menu
hl.bind("SUPER + ALT + Space", hl.dsp.exec_cmd(menu))

--HELP SUPER + SHIFT + W           | Open browser
hl.bind("SUPER + SHIFT + W", hl.dsp.exec_cmd(browser))

--HELP SUPER + SHIFT + E           | Open file manager
hl.bind("SUPER + SHIFT + E", hl.dsp.exec_cmd(filemanager))

--HELP SUPER + SHIFT + M           | Open Telegram and Whatsapp in browser
hl.bind("SUPER + SHIFT + M",
    hl.dsp.exec_cmd(browser .. " --new-window https://web.telegram.org/a/ --new-window https://web.whatsapp.com/"))

--HELP SUPER + SHIFT + N           | Open text editor in desktop notes folder
hl.bind("SUPER + SHIFT + N", hl.dsp.exec_cmd(editor .. " ~/Desktop/notes/"))

--HELP SUPER + SHIFT + V           | Open clipboard menu
hl.bind("SUPER + SHIFT + V", hl.dsp.exec_cmd(terminal .. " --class clipse -e 'clipse'"))

--HELP SUPER + SHIFT + P           | Open TUI package manager
hl.bind("SUPER + SHIFT + P", hl.dsp.exec_cmd(terminal .. " -e 'gopac'"))

--HELP SUPER + SHIFT + H           | Open keybinds helper menu
hl.bind("SUPER + SHIFT + H", hl.dsp.exec_cmd(keybindhelp))

--HELP SUPER + F                   | Toggle fullscreen
hl.bind("SUPER + F", hl.dsp.window.fullscreen())

--HELP SUPER + V                   | Toggle float state
hl.bind("SUPER + V", hl.dsp.window.float({ action = "toggle" }))

--HELP SUPER + J                   | Toggle horizontal/vertical split in layout
hl.bind("SUPER + J", hl.dsp.layout("togglesplit"))

--HELP SUPER + [ARROW KEYS]        | Move window focus
hl.bind("SUPER + left", hl.dsp.focus({ direction = "l" }))
hl.bind("SUPER + right", hl.dsp.focus({ direction = "r" }))
hl.bind("SUPER + up", hl.dsp.focus({ direction = "u" }))
hl.bind("SUPER + down", hl.dsp.focus({ direction = "d" }))

--HELP SUPER + SHIFT + [ARROW KEYS]| Move active window
hl.bind("SUPER + SHIFT + left", hl.dsp.window.move({ direction = "l" }))
hl.bind("SUPER + SHIFT + right", hl.dsp.window.move({ direction = "r" }))
hl.bind("SUPER + SHIFT + up", hl.dsp.window.move({ direction = "u" }))
hl.bind("SUPER + SHIFT + down", hl.dsp.window.move({ direction = "d" }))

--HELP SUPER + ALT + [ARROW KEYS]  | Resize active window
hl.bind("SUPER + ALT + left", hl.dsp.window.resize({ x = -30, y = 0, relative=true }))
hl.bind("SUPER + ALT + right", hl.dsp.window.resize({ x = 30, y = 0, relative=true }))
hl.bind("SUPER + ALT + up", hl.dsp.window.resize({ x = 0, y = -30, relative=true }))
hl.bind("SUPER + ALT + down", hl.dsp.window.resize({ x = 0, y = 30, relative=true }))

--HELP SUPER + [NUMBER]            | Select workspace
--HELP SUPER + SHIFT + [NUMBER]    | Move active window to workspace
for i = 1, 10 do
    local key = i % 10
    hl.bind("SUPER + " .. key, hl.dsp.focus({ workspace = i }))
    hl.bind("SUPER + SHIFT + " .. key, hl.dsp.window.move({ workspace = i }))
end

--HELP SUPER + S                   | Toggle special workspace
hl.bind("SUPER + S", hl.dsp.workspace.toggle_special("magic"))

--HELP SUPER + SHIFT + S           | Move active window to special workspace
hl.bind("SUPER + SHIFT + S", hl.dsp.window.move({ workspace = "special:magic" }))

--HELP SUPER + [SCROLL WHEEL]      | Scroll through existing workspaces
hl.bind("SUPER + mouse_up", hl.dsp.focus({ workspace = "m+1" }))
hl.bind("SUPER + mouse_down", hl.dsp.focus({ workspace = "m-1" }))

--HELP SUPER + CTRL + [LEFT/RIGHT] | Scroll through existing workspaces
hl.bind("SUPER + CTRL + right", hl.dsp.focus({ workspace = "m+1" }))
hl.bind("SUPER + CTRL + left", hl.dsp.focus({ workspace = "m-1" }))

--HELP [SIDE MOUSE BUTTONS]        | Scroll through existing workspaces window
hl.bind("mouse:275", hl.dsp.focus({ workspace = "m+1" }))
hl.bind("mouse:276", hl.dsp.focus({ workspace = "m-1" }))

--HELP SUPER + [LEFT MOUSE BUTTON] | Move window
hl.bind("SUPER + mouse:272", hl.dsp.window.drag(), { mouse = true })

--HELP SUPER + [RIGHT MOUSE BUTTON]| Resize window
hl.bind("SUPER + mouse:273", hl.dsp.window.resize(), { mouse = true })

--HELP PRINT                       | Screenshot region
hl.bind("PRINT", hl.dsp.exec_cmd("hyprshot -m region"))

--HELP ALT + PRINT                 | Screenshot window
hl.bind("ALT + PRINT", hl.dsp.exec_cmd("hyprshot -m window"))

--HELP CTRL + PRINT                | Screenshot screen
hl.bind("CTRL + PRINT", hl.dsp.exec_cmd("hyprshot -m output"))

-- Laptop multimedia keys for volume and LCD brightness
hl.bind("XF86AudioRaiseVolume", hl.dsp.exec_cmd("wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+"), { locked = true, repeating = true })
hl.bind("XF86AudioLowerVolume", hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"), { locked = true, repeating = true })
hl.bind("XF86AudioMute", hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"), { locked = true, repeating = true })
hl.bind("XF86AudioMicMute", hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"), { locked = true, repeating = true })
hl.bind("XF86MonBrightnessUp", hl.dsp.exec_cmd("brightnessctl -e4 -n2 set 5%+"), { locked = true, repeating = true })
hl.bind("XF86MonBrightnessDown", hl.dsp.exec_cmd("brightnessctl -e4 -n2 set 5%-"), { locked = true, repeating = true })
