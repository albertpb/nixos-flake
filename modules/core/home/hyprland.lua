local function configure(cfg)
	for _, monitor in ipairs(cfg.monitors) do
		hl.monitor(monitor)
	end

	hl.env("XCURSOR_SIZE", "48")
	hl.env("XCURSOR_THEME", "capitaine-cursors")
	hl.env("QT_QPA_PLATFORM", "wayland")
	hl.env("QT_QPA_PLATFORMTHEME", "gtk3")
	hl.env("QT_QPA_PLATFORMTHEME_QT6", "gtk3")
	hl.env("ELECTRON_OZONE_PLATFORM_HINT", "auto")
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
		hl.exec_cmd("hyprctl setcursor capitaine-cursors 48")
		hl.exec_cmd("systemctl --user start dms.service")
		for _, command in ipairs(cfg.autostart or {}) do
			hl.exec_cmd(command)
		end
	end)

	hl.layer_rule({
		name = "dms_no_anim",
		match = { namespace = "dms:.*" },
		no_anim = true,
	})
	hl.layer_rule({
		name = "dms_modals_blur",
		match = {
			namespace = "dms:(polkit|notification-center-modal|workspace-overview|color-picker|clipboard|spotlight|settings|process-list-modal)",
		},
		blur = true,
		ignore_alpha = 0,
	})
	hl.layer_rule({
		name = "dms_shell_blur",
		match = {
			namespace = "dms:(bar|tooltip|toast|dock-context-menu|tray-menu-window|control-center|notification-center-popout|dash|system-update|process-list-popout|battery|popout|app-launcher)",
		},
		blur = true,
		ignore_alpha = 0,
	})

	for workspace, monitor in pairs(cfg.workspaces or {}) do
		hl.workspace_rule({ workspace = tostring(workspace), monitor = monitor })
	end

	local main_mod = "SUPER"
	hl.bind(main_mod .. " + Q", hl.dsp.exec_cmd("kitty"))
	hl.bind(main_mod .. " + C", hl.dsp.window.close())
	hl.bind(main_mod .. " + SHIFT + M", hl.dsp.exit())
	hl.bind(main_mod .. " + SHIFT + V", hl.dsp.window.float({ action = "toggle" }))
	hl.bind(main_mod .. " + P", hl.dsp.window.pseudo())
	hl.bind(main_mod .. " + SPACE", hl.dsp.exec_cmd("dms ipc call spotlight toggle"))
	hl.bind(main_mod .. " + V", hl.dsp.exec_cmd("dms ipc call clipboard toggle"))
	hl.bind(main_mod .. " + M", hl.dsp.exec_cmd("dms ipc call processlist focusOrToggle"))
	hl.bind(main_mod .. " + comma", hl.dsp.exec_cmd("dms ipc call settings focusOrToggle"))
	hl.bind(main_mod .. " + N", hl.dsp.exec_cmd("dms ipc call notifications toggle"))
	hl.bind(main_mod .. " + Y", hl.dsp.exec_cmd("dms ipc call dankdash wallpaper"))
	hl.bind(main_mod .. " + TAB", hl.dsp.exec_cmd("dms ipc call hypr toggleOverview"))
	hl.bind(main_mod .. " + ALT + L", hl.dsp.exec_cmd("dms ipc call lock lock"))

	hl.bind("XF86AudioRaiseVolume", hl.dsp.exec_cmd("dms ipc call audio increment 3"), {
		locked = true,
		repeating = true,
	})
	hl.bind("XF86AudioLowerVolume", hl.dsp.exec_cmd("dms ipc call audio decrement 3"), {
		locked = true,
		repeating = true,
	})
	hl.bind("XF86AudioMute", hl.dsp.exec_cmd("dms ipc call audio mute"), { locked = true })
	hl.bind("XF86MonBrightnessUp", hl.dsp.exec_cmd("dms ipc call brightness increment 5"), {
		locked = true,
		repeating = true,
	})
	hl.bind("XF86MonBrightnessDown", hl.dsp.exec_cmd("dms ipc call brightness decrement 5"), {
		locked = true,
		repeating = true,
	})

	if cfg.toggle_split then
		hl.bind(main_mod .. " + J", hl.dsp.layout("togglesplit"))
	end

	hl.bind(main_mod .. " + left", hl.dsp.focus({ direction = "left" }))
	hl.bind(main_mod .. " + right", hl.dsp.focus({ direction = "right" }))
	hl.bind(main_mod .. " + up", hl.dsp.focus({ direction = "up" }))
	hl.bind(main_mod .. " + down", hl.dsp.focus({ direction = "down" }))

	for workspace = 1, 5 do
		local key = tostring(workspace)

		hl.bind(main_mod .. " + " .. key, hl.dsp.focus({ workspace = workspace }))
		hl.bind(main_mod .. " + SHIFT + " .. key, hl.dsp.window.move({ workspace = workspace }))
	end

	hl.bind(main_mod .. " + mouse_down", hl.dsp.focus({ workspace = "e+1" }))
	hl.bind(main_mod .. " + mouse_up", hl.dsp.focus({ workspace = "e-1" }))
	hl.bind(main_mod .. " + SHIFT + S", hl.dsp.exec_cmd('grim -g "$(slurp -d)" - | wl-copy'))
	hl.bind("Print", hl.dsp.exec_cmd("grim - | wl-copy"))
	hl.bind(main_mod .. " + mouse:272", hl.dsp.window.drag(), { mouse = true })
	hl.bind(main_mod .. " + mouse:273", hl.dsp.window.resize(), { mouse = true })
end
