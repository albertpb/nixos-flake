{ pkgs, ... }:
{
  home.packages = [ pkgs.hypridle ];

  home.pointerCursor = {
    package = pkgs.capitaine-cursors;
    name = "capitaine-cursors";
    size = 48;
    gtk.enable = true;
    x11.enable = true;
  };

  home.file.".config/hypr/hypridle.conf".text = ''
    listener {
      timeout = 900
      on-timeout = hyprctl dispatch 'dpms("off")'
      on-resume = hyprctl dispatch 'dpms("on")'
    }
  '';
}
