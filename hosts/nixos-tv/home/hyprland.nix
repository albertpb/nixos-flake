{ ... }: {
  imports = [ ../../../modules/core/home/hyprland.nix ];

  home.file.".config/hypr/hyprland.lua".text =
    builtins.readFile ../../../modules/core/home/hyprland.lua
    + ''
      configure({
          monitors = {
              { output = "", mode = "2560x1440@240", position = "0x0", scale = 1 },
          },
          drm_device = "/dev/dri/card1",
          workspaces = {
              [1] = "HDMI-A-2",
              [2] = "HDMI-A-2",
              [3] = "HDMI-A-2",
              [4] = "HDMI-A-2",
              [5] = "HDMI-A-2",
          },
          ignore_opacity = true,
          vrr = 1,
      })
    '';
}
