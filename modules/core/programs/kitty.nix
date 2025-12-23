{ pkgs, ... }:
{
  programs.kitty = {
    enable = true;
    themeFile = "tokyo_night_night";
    font = {
      name = "FiraCode Nerd Font";
      size = 12;
    };
    extraConfig = ''
      shell zsh -l
      background_opacity 0.6
    '';
  };
}
