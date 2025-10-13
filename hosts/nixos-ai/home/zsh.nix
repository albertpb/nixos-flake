{ pkgs, lib, config, ... }:
{
  home.file.".zshrc".text = lib.mkAfter '' 
    export HF_HOME=/mnt/ai1/Huggingface
  '';
}
