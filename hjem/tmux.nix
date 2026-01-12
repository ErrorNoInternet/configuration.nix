{ pkgs, ... }:
{
  xdg.config.files = with pkgs; {
    "tmux/tmux.conf".text = ''
      set  -g default-terminal "tmux-256color"
      set  -g base-index      1
      setw -g pane-base-index 1

      set -g status-keys vi
      set -g mode-keys   vi

      set  -g mouse             on
      setw -g aggressive-resize off
      setw -g clock-mode-style  24
      set  -s escape-time       0
      set  -g history-limit     500000

      set -g status off
      set-hook -g after-kill-pane       'if "[ #{session_windows} -lt 2 ]" "set status off"'
      set-hook -g after-new-window      'if "[ #{session_windows} -gt 1 ]" "set status on"'
      set-hook -g pane-exited           'if "[ #{session_windows} -lt 2 ]" "set status off"'
      set-hook -g window-layout-changed 'if "[ #{session_windows} -gt 1 ]" "set status on"'
      set-hook -g window-layout-changed 'if "[ #{session_windows} -lt 2 ]" "set status off"'

      set -ug status-bg
      set -g status-style bg=default
      set -g status-left "#[fg=brightwhite,bg=default]#[fg=black,bg=brightwhite,bold] #S #[fg=brightwhite,bg=default,nobold,noitalics,nounderscore] "
      set -g status-right " #[fg=brightblack,bg=default,nobold,noitalics,nounderscore]#[fg=brightwhite,bg=brightblack] %Y-%m-%d \
      #[fg=brightwhite,bg=brightblack,nobold,noitalics,nounderscore]|#[fg=brightwhite,bg=brightblack] %H:%M \
      #[fg=brightwhite,bg=brightblack,nobold,noitalics,nounderscore]#[fg=black,bg=brightwhite,bold] #H#{prefix_highlight}#[fg=brightwhite,bg=default,nobold]"
      set -g @prefix_highlight_fg 'black'
      set -g @prefix_highlight_bg 'brightwhite'
      set -g @prefix_highlight_empty_attr 'bg=brightwhite'
      set -g @prefix_highlight_empty_prompt ' '
      set -g window-status-bell-style bg=default
      set -g window-status-format "#[fg=brightblack,bg=default,nobold,noitalics,nounderscore]#[fg=brightwhite,bg=brightblack] #I \
      #[fg=brightwhite,bg=brightblack,nobold,noitalics,nounderscore]| #[fg=brightwhite,bg=brightblack]#W #F #[fg=brightblack,bg=default,nobold,noitalics,nounderscore]"
      set -g window-status-current-format "#[fg=brightwhite,bg=default]#[nobold]#[noitalics]#[nounderscore]#[fg=black,bg=brightwhite] #I \
      #[fg=black,bg=brightwhite,nobold,noitalics,nounderscore]| #[fg=black,bg=brightwhite]#W #F #[fg=brightwhite,bg=default,nobold,noitalics,nounderscore]"
      set -g pane-border-style 'fg=brightblack'
      set -g pane-active-border-style 'fg=brightwhite'
      set -g @jump-bg-color '\e[0m\e[90m'
      set -g @jump-fg-color '\e[1m\e[33m'
      set -g status-left-length 20

      set -g allow-passthrough on
      set -g focus-events off
      set -g repeat-time 0
      set -g set-clipboard on
      set -g set-titles on
      set -ga terminal-overrides ",xterm*:RGB"

      set -ga update-environment DISPLAY
      set -ga update-environment HYPRLAND_INSTANCE_SIGNATURE
      set -ga update-environment SSH_AUTH_SOCK
      set -ga update-environment SSH_TTY
      set -ga update-environment TERM
      set -ga update-environment TERM_PROGRAM
      set -ga update-environment TERMINAL
      set -ga update-environment WAYLAND_DISPLAY

      bind '"' split-window -v -c "#{pane_current_path}"
      bind '%' split-window -h -c "#{pane_current_path}"
      bind -n C-F3 "set status"
      bind -n S-Left previous-window
      bind -n S-Right next-window
      bind -r -T prefix C-Down resize-pane -D 6
      bind -r -T prefix C-g display-popup
      bind -r -T prefix C-Left resize-pane -L 8
      bind -r -T prefix C-Right resize-pane -R 8
      bind -r -T prefix C-Up resize-pane -U 6
      bind -T copy-mode-vi 'End' send -X end-of-line
      bind -T copy-mode-vi 'Home' send -X start-of-line
      bind -T copy-mode-vi C-Left send -X previous-word
      bind -T copy-mode-vi C-Right send -X next-word
      bind -T copy-mode-vi C-v send -X rectangle-toggle
      bind -T copy-mode-vi v send -X begin-selection
      bind -T copy-mode-vi y send -X copy-pipe-and-cancel 'wl-copy'

      run-shell ${tmuxPlugins.jump}/share/tmux-plugins/jump/tmux-jump.tmux
      run-shell ${tmuxPlugins.prefix-highlight}/share/tmux-plugins/prefix-highlight/prefix_highlight.tmux
      run-shell ${tmuxPlugins.yank}/share/tmux-plugins/yank/yank.tmux
    '';
  };
}
