{ pkgs, username, ... }: {
  environment.systemPackages = with pkgs;
    [
      neovim
      ripgrep
      zoxide
      fzf
      gcc
      glib
      ranger
      wget
      killall
      zip
      unzip
      btop
      htop
      hwloc
      usbutils
      lshw
      curl
      gzip
      lazygit
      nil
      tmuxifier
      nodejs
      yarn
      stress-ng
      dysk
      smartmontools
      ethtool
      ffmpeg-full
      lm_sensors
      gopls
      go
    ] ++ [ stylua lua-language-server marksman nixfmt-classic ];
}

