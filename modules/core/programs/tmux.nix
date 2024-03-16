{pkgs,...}:
{
  programs.tmux = {
    enable = true;
    
    shell = "${pkgs.zsh}/bin/zsh";
    terminal = "tmux-256color";

    plugins = with pkgs.tmuxPlugins; [
      vim-tmux-navigator
      better-mouse-mode
      {
        plugin = catppuccin;
        extraConfig = ''
          set -g @catppuccin_flavour 'frappe'

          set -g @catppuccin_icon_window_last "󰖰 "
          set -g @catppuccin_icon_window_current "󰖯 "
          set -g @catppuccin_icon_window_zoom "󰁌 "
          set -g @catppuccin_icon_window_mark "󰃀 "
          set -g @catppuccin_icon_window_silent "󰂛 "
          set -g @catppuccin_icon_window_activity "󱅫 "
          set -g @catppuccin_icon_window_bell "󰂞 "

        '';
      }
    ];

    extraConfig = ''
      unbind r
      bind r source-file ~/.config/tmux/tmux.conf

      set -g prefix C-s

      set -g status-position top
      
      set -g base-index 1       # Start numbering windows at 1, not 0.
      set -g pane-base-index 1  # Start numbering panes at 1, not 0.
      
      # easy-to-remember split pane commands
      bind | split-window -h -c "#{pane_current_path}"
      bind - split-window -v -c "#{pane_current_path}"
      bind c new-window -c "#{pane_current_path}"
      

      # act like vim
      setw -g mode-keys vi
      bind-key h select-pane -L
      bind-key j select-pane -D
      bind-key k select-pane -U
      bind-key l select-pane -R
    '';
  };
}
