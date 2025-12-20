{ pkgs, lib, config, ... }:
{
  programs.zsh = {
    initContent = '' 
      export HF_HOME=/mnt/ai1/Huggingface
    '';
  };
}
