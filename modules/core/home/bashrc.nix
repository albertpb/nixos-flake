{ pkgs, config, ... }:
{
  home.file.".bashrc".text = ''
    if test -t 1; then
      exec zsh
    fi
  '';
}
