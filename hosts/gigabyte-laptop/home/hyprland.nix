{ ... }: {
  imports = [ ../../../modules/core/home/hyprland.nix ];

  home.file.".config/hypr/hyprland.lua".text =
    builtins.readFile ../../../modules/core/home/hyprland.lua
    + ''
      configure({
          monitors = {
              { output = "eDP-1", mode = "1920x1080@144", position = "0x0", scale = 1 },
          },
          drm_device = "/dev/dri/card0",
          ignore_opacity = true,
          toggle_split = true,
      })
    '';
}
