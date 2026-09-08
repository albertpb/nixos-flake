{ pkgs, ... }: {
  imports = [ ../../../modules/core/home/hyprland.nix ];

  home.packages = [ pkgs.hypridle ];

  home.file.".config/hypr/hyprland.lua".text =
    builtins.readFile ../../../modules/core/home/hyprland.lua
    + ''
      configure({
          monitors = {
              { output = "DP-1", mode = "2560x1440@144", position = "0x0", scale = 1, transform = 1 },
          },
          workspaces = {
              [1] = "DP-1",
              [2] = "DP-1",
              [3] = "DP-1",
              [4] = "DP-1",
              [5] = "DP-1",
          },
          ignore_opacity = true,
          vrr = 1,
          autostart = { "hypridle" },
      })
    '';

  home.file.".config/hypr/hypridle.conf".text = ''
    listener {
      timeout = 900
      on-timeout = hyprctl dispatch dpms off
      on-resume = hyprctl dispatch dpms on
    }
  '';
}
