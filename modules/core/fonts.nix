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

    (nerdfonts.override {
      fonts = [
        "FiraCode"
        "DroidSansMono"
        "JetBrainsMono"
        "Meslo"
        "Iosevka"
        "IosevkaTerm"
        "Hack"
      ];
    })
  ];
}
