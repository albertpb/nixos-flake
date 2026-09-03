{ pkgs, ... }:
{
  home.pointerCursor = {
    package = pkgs.capitaine-cursors;
    name = "capitaine-cursors";
    size = 48;
    gtk.enable = true;
    x11.enable = true;
  };
}
