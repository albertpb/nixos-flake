{ pkgs, ... }: {
  programs.hyprland = {
    enable = true;
    withUWSM = true;

    # The hyprland package to use
    package = pkgs.hyprland;
    # Whether to enable XWayland
    xwayland.enable = true;
  };
}
