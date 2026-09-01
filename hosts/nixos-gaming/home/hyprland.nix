{ username, ... }: {
  home.file.".config/hypr/hyprland.lua".text = builtins.readFile ../../../modules/core/home/hyprland.lua + ''
    configure({
        wallpaper_dir = "/home/${username}/wallpapers",
        monitors = {
            { output = "", mode = "3840x2160@240", position = "0x0", scale = 1 },
        },
        drm_device = "/dev/dri/card1",
        autostart = { "hypridle" },
        workspaces = {
            [1] = "HDMI-A-2",
            [2] = "HDMI-A-2",
            [3] = "HDMI-A-2",
            [4] = "HDMI-A-2",
            [5] = "HDMI-A-2",
        },
        ignore_opacity = false,
        vrr = 1,
    })
  '';

  imports = [ (import ../../../modules/core/home/hyprland.nix) ];
}
