{ pkgs, username, ... }: {
  users.users.${username}.packages = with pkgs; [
    floorp
    nixpkgs-fmt
    libsecret
    xdg-utils
    pavucontrol
    rnnoise-plugin
    sxiv
    feh
    libnotify
  ];

  environment.systemPackages = with pkgs;
    [
      neovim
      ripgrep
      thefuck
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
    ] ++ [ stylua lua-language-server marksman nixfmt-classic ];

}

