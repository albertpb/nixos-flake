{ pkgs, ... }:
{
  programs.kitty = {
    enable = true;
    theme = "Tokyo Night";
    font = {
      name = "FiraCode Nerd Font";
      size = 10;
    };
    extraConfig = ''
      background_opacity 0.6
    '';
  };
}
