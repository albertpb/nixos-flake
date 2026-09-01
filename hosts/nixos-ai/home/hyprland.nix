{ username, ... }: {
  home.file.".config/hypr/hyprland.lua".text = builtins.readFile ../../../modules/core/home/hyprland.lua + ''
    configure({
        wallpaper_dir = "/home/${username}/wallpapers",
        monitors = {
            { output = "", mode = "2560x1440@240", position = "0x0", scale = 1 },
        },
        drm_device = "/dev/dri/card1",
        autostart = { "hypridle", "sunshine" },
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

  home.file.".config/hypr/hypridle.conf".text = ''
    listener {
      timeout = 900                           # 15min
      on-timeout = hyprctl dispatch dpms off
      on-resume = hyprctl dispatch dpms on
    }
  '';

  imports = [ (import ../../../modules/core/home/hyprland.nix) ];
}
