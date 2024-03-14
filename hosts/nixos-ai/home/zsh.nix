{ pkgs, config, ... }:
{
  home.file.".bashrc".text = ''
    if test -t 1; then
      exec zsh
    fi
  '';

  programs.zsh = {
    enable = true;
    enableCompletion = true;
    enableAutosuggestions = true;
    syntaxHighlighting.enable = true;

    shellAliases = {
      ll = "ls -l";
      nix-shell = "nix-shell --run zsh";
    };
    history.size = 10000;
    history.path = "${config.xdg.dataHome}/zsh/history";

    initExtra = ''
      macchina
    '';

    oh-my-zsh = {
      enable = true;
      plugins = [ "git" ];
      theme = "agnoster";
    };
  };
}
