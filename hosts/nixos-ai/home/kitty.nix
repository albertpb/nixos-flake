{ pkgs, ... }:
{
  programs.kitty = {
    enable = true;
    theme = "Tokyo Night";
    font = {
      name = "Fira Code";
      size = 10;
    };
    extraConfig = ''
      background_opacity 0.5
      background_blur 64
      linux_display_server x11
      dynamic_background_opacity yes
    '';
  };
}
