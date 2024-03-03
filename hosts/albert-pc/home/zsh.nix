{ pkgs, config, ... }:
{
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    enableAutosuggestions = true;
    syntaxHighlighting.enable = true;

    shellAliases = {
      ll = "ls -l";
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
