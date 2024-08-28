{ pkgs, username, ... }: {
  #nixos-ai
  users.users.${username}.packages = with pkgs; [
    xclip
    polybar
    picom
    sxhkd
    rofi
    dunst
    feh
    lxappearance
    macchina
    glxinfo
    brasero
  ];

  environment.systemPackages = with pkgs; [
    linuxKernel.packages.linux_xanmod.turbostat
    linuxPackages.nvidia_x11
    zenmonitor
  ];

}
