{ self, pkgs, lib, inputs, ... }:
{
  nix = {
    settings = {
      auto-optimise-store = true;
      experimental-features = [ "nix-command" "flakes" ];
    };

    gc = {
      automatic = true;
      dates = "weekly";
      options = "--delete-older-than 7d";
    };
  };

  nixpkgs = {
    overlays = [ ];
    config.allowUnfree = true;
  };

  users.defaultUserShell = pkgs.zsh;

  programs.zsh.enable = true;

  security = {
    sudo.enable = true;
  };

  environment.systemPackages = with pkgs; [
    wget
    pciutils
  ];

  time.timeZone = "America/Santiago";
  i18n.defaultLocale = "en_US.UTF-8";
  system.stateVersion = "26.05";
}
