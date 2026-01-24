{
  pkgs,
  lib,
  config,
  ...
}:
{
  programs.zsh = {
    initContent = ''
      export HF_HOME=/mnt/ai1/Huggingface
    '';

    shellAliases = {
      "4k" = "hyprctl keyword monitor ',3840x2160@240,0x0,1'";
      "2k" = "hyprctl keyword monitor ',2560x1440@240,0x0,1'";
    };

  };
}
