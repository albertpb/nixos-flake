local function configure(cfg)
	for _, monitor in ipairs(cfg.monitors) do
		hl.monitor(monitor)
	end

	hl.env("XCURSOR_SIZE", "24")
	if cfg.drm_device then
		hl.env("AQ_DRM_DEVICES", cfg.drm_device)
	end

	local blur = {
		enabled = true,
		passes = 2,
		noise = 0.02,
		size = 8,
		contrast = 1.6,
	}
	if cfg.ignore_opacity ~= nil then
		blur.ignore_opacity = cfg.ignore_opacity
	end

	local dwindle = { preserve_split = true }

	local misc = {
		force_default_wallpaper = 0,
		disable_hyprland_logo = true,
		disable_splash_rendering = true,
	}
	if cfg.vrr ~= nil then
		misc.vrr = cfg.vrr
	end

	hl.config({
		input = {
			kb_layout = "us",
			kb_variant = "",
			kb_model = "",
			kb_options = "",
			kb_rules = "",
			follow_mouse = 1,
			sensitivity = 0,
			touchpad = { natural_scroll = false },
		},
		general = {
			gaps_in = 5,
			gaps_out = 20,
			border_size = 2,
			col = {
				active_border = {
					colors = { "rgba(33ccffee)", "rgba(00ff99ee)" },
					angle = 45,
				},
				inactive_border = "rgba(595959aa)",
			},
			layout = "dwindle",
			allow_tearing = false,
		},
		decoration = {
			rounding = 3,
			blur = blur,
		},
		animations = { enabled = true },
		dwindle = dwindle,
		misc = misc,
	})

	hl.curve("myBezier", {
		type = "bezier",
		points = { { 0.05, 0.9 }, { 0.1, 1.05 } },
	})
	hl.animation({ leaf = "windows", enabled = true, speed = 7, bezier = "myBezier" })
	hl.animation({
		leaf = "windowsOut",
		enabled = true,
		speed = 7,
		bezier = "default",
		style = "popin 80%",
	})
	hl.animation({ leaf = "border", enabled = true, speed = 10, bezier = "default" })
	hl.animation({ leaf = "borderangle", enabled = true, speed = 8, bezier = "default" })
	hl.animation({ leaf = "fade", enabled = true, speed = 7, bezier = "default" })
	hl.animation({ leaf = "workspaces", enabled = true, speed = 6, bezier = "default" })

	hl.on("hyprland.start", function()
		hl.exec_cmd("hyprctl setcursor capitaine-cursors 24")
		hl.exec_cmd("waybar")
		hl.exec_cmd("hyprpaper")
		hl.exec_cmd("blueman-applet")
		hl.exec_cmd("systemctl --user enable --now hyprpolkitagent.service")
		hl.exec_cmd("nm-applet --indicator")
		for _, command in ipairs(cfg.autostart or {}) do
			hl.exec_cmd(command)
		end
	end)

	hl.layer_rule({
		name = "waybar_blur",
		match = { namespace = "waybar" },
		blur = true,
	})
	if cfg.blur_rofi then
		hl.layer_rule({
			name = "rofi_blur",
			match = { namespace = "rofi" },
			blur = true,
		})
	end

	for workspace, monitor in pairs(cfg.workspaces or {}) do
		hl.workspace_rule({ workspace = tostring(workspace), monitor = monitor })
	end

	local main_mod = "SUPER"
	hl.bind(main_mod .. " + Q", hl.dsp.exec_cmd("kitty"))
	hl.bind(main_mod .. " + C", hl.dsp.window.close())
	hl.bind(main_mod .. " + M", hl.dsp.exit())
	hl.bind(main_mod .. " + V", hl.dsp.window.float({ action = "toggle" }))
	hl.bind(main_mod .. " + P", hl.dsp.window.pseudo())
	hl.bind(main_mod .. " + SPACE", hl.dsp.exec_cmd("rofi -show run"))

	if cfg.toggle_split then
		hl.bind(main_mod .. " + J", hl.dsp.layout("togglesplit"))
	end

	hl.bind(main_mod .. " + left", hl.dsp.focus({ direction = "left" }))
	hl.bind(main_mod .. " + right", hl.dsp.focus({ direction = "right" }))
	hl.bind(main_mod .. " + up", hl.dsp.focus({ direction = "up" }))
	hl.bind(main_mod .. " + down", hl.dsp.focus({ direction = "down" }))

	for workspace = 1, 5 do
		local key = tostring(workspace)
		local wallpaper = cfg.wallpaper_dir .. "/" .. key .. ".png"
		local wallpaper_command = "hyprctl hyprpaper wallpaper ', " .. wallpaper .. "'"

		hl.bind(main_mod .. " + " .. key, hl.dsp.focus({ workspace = workspace }))
		hl.bind(main_mod .. " + " .. key, hl.dsp.exec_cmd(wallpaper_command))
		hl.bind(main_mod .. " + SHIFT + " .. key, hl.dsp.window.move({ workspace = workspace }))
		hl.bind(main_mod .. " + SHIFT + " .. key, hl.dsp.exec_cmd(wallpaper_command))
	end

	hl.bind(main_mod .. " + mouse_down", hl.dsp.focus({ workspace = "e+1" }))
	hl.bind(main_mod .. " + mouse_up", hl.dsp.focus({ workspace = "e-1" }))
	hl.bind(main_mod .. " + SHIFT + S", hl.dsp.exec_cmd('grim -g "$(slurp -d)" - | wl-copy'))
	hl.bind("Print", hl.dsp.exec_cmd("grim - | wl-copy"))
	hl.bind(main_mod .. " + mouse:272", hl.dsp.window.drag(), { mouse = true })
	hl.bind(main_mod .. " + mouse:273", hl.dsp.window.resize(), { mouse = true })
end
