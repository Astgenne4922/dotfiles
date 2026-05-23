-- Ignore maximize requests from apps. You'll probably like this.
hl.window_rule({
    match = { class = ".*" },
    suppress_event = "maximize"
})

-- Fix some apps hanging while in a out of focus workspace
hl.window_rule({
    match = { class = ".*" },
    render_unfocused = true
})

-- Fix some dragging issues with XWayland
hl.window_rule({
    match = {
        class = "^$",
        title = "^$",
        xwayland = true,
        float = true,
        fullscreen = false,
        pin = false
    },
    no_focus = true
})

-- Clipse floating window
hl.window_rule({
    match = { class = "(clipse)" },
    float = true,
    size = { 622, 652 },
})

--windowrule = maxsize 1080 640, floating:1
--windowrule = center 1, floating:1
