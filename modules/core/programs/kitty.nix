{ pkgs, ... }:
{
  programs.kitty = {
    enable = true;
    themeFile = "tokyo_night_night";
    font = {
      name = "FiraCode Nerd Font";
      size = 10;
    };
    extraConfig = ''
      background_opacity 0.6
    '';
  };
}
