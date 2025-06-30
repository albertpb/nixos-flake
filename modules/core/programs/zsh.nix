{ pkgs, config, ... }:
{
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    syntaxHighlighting.enable = true;

    autosuggestion = {
      enable = true;
    };

    shellAliases = {
      ll = "ls -l";
      rs-pipewire = "systemctl --user restart pipewire.service";
      sample = "pw-metadata -n settings 0 clock.force-rate";
    };
    history.size = 10000;
    history.path = "${config.xdg.dataHome}/zsh/history";

    initContent = ''
      if [[ -z "''${TMUX}" ]];
      then
          tmux attach -t TMUX || tmux new -s TMUX
          eval "''${tmuxifier init -}"
      fi
    '';

    plugins = [
      {
        name = "zsh-nix-shell";
        file = "nix-shell.plugin.zsh";
        src = pkgs.fetchFromGitHub {
          owner = "chisui";
          repo = "zsh-nix-shell";
          rev = "v0.8.0";
          sha256 = "1lzrn0n4fxfcgg65v0qhnj7wnybybqzs4adz7xsrkgmcsr0ii8b7";
        };
      }
    ];

    oh-my-zsh = {
      enable = true;
      plugins = [ 
        "git"
        "thefuck"
        "tmux"
        "zoxide"
      ];
      theme = "amuse";
    };
  };
}
