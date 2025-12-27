{ pkgs, ... }:
{
  fonts.packages = with pkgs; [
    noto-fonts
    font-awesome
    powerline-fonts
    powerline-symbols
    material-icons
    material-design-icons
    corefonts
    nerd-fonts.fira-code
    nerd-fonts.droid-sans-mono
    nerd-fonts.jetbrains-mono
    nerd-fonts.meslo-lg
    nerd-fonts.iosevka
    nerd-fonts.iosevka-term
    nerd-fonts.hack
    nerd-fonts.symbols-only
    emacs-all-the-icons-fonts
  ];
}
