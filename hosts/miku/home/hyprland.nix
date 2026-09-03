{ ... }:
{
  imports = [ ../../../modules/core/home/hyprland.nix ];

  home.file.".config/hypr/hyprland.lua".text =
    builtins.readFile ../../../modules/core/home/hyprland.lua
    + ''
      configure({
          monitors = {
              { output = "", mode = "preferred", position = "0x0", scale = 1 },
          },
          workspaces = {
              [1] = "",
              [2] = "",
              [3] = "",
              [4] = "",
              [5] = "",
          },
          ignore_opacity = true,
      })
    '';
}
