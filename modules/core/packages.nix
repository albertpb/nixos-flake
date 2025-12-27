{ pkgs, username, ... }: {
  environment.systemPackages = with pkgs;
    [
      neovim
      emacs
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
      sqlite
      python312
      yarn
      stress-ng
      dysk
      smartmontools
      ethtool
      ffmpeg-full
      nvme-cli
      lm_sensors
      gopls
      go
      fd
      imagemagick
    ] ++ [ stylua lua-language-server marksman nixfmt-classic ];
}

