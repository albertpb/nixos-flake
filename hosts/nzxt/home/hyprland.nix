{ username, ... }: {
  home.file.".config/hypr/hyprland.lua".text = builtins.readFile ../../../modules/core/home/hyprland.lua + ''
    configure({
        wallpaper_dir = "/home/${username}/wallpapers",
        monitors = {
            { output = "DP-1", mode = "2560x1440@144", position = "0x0", scale = 1, transform = 1 },
            { output = "HDMI-A-1", mode = "2560x1440@144", position = "1440x0", scale = 1 },
        },
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
