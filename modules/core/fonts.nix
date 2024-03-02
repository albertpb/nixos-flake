{ pkgs, ... }:
{
  fonts.packages = with pkgs; [
    noto-fonts
    font-awesome
    powerline-fonts
    powerline-symbols
    material-design-icons
    (nerdfonts.override {
      fonts = [
        "FiraCode"
        "DroidSansMono"
        "JetBrainsMono"
        "Meslo"
        "Iosevka"
        "IosevkaTerm"
      ];
    })
  ];
}
