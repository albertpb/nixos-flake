{ pkgs, ... }:
{
  hardware.graphics = {
    enable = true;
    extraPackages = with pkgs; [
      mesa
      libva
      libva-utils
    ];
  };
}
