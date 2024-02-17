{
  config,
  lib,
  pkgs,
  ...
}: {
  config = lib.mkIf config.home.programs.terminal.fish.enable {
    programs.tmux = {
      enable = true;
      plugins = with pkgs.tmuxPlugins; [
        catppuccin
        jump
        yank
      ];

      baseIndex = 1;
      clock24 = true;
      escapeTime = 0;
      historyLimit = 1000000;
      keyMode = "vi";
      mouse = true;
      terminal = "tmux-256color";

      extraConfig = ''
        set -g status off
        set-hook -g after-new-window      'if "[ #{session_windows} -gt 1 ]" "set status on"'
        set-hook -g after-kill-pane       'if "[ #{session_windows} -lt 2 ]" "set status off"'
        set-hook -g pane-exited           'if "[ #{session_windows} -lt 2 ]" "set status off"'
        set-hook -g window-layout-changed 'if "[ #{session_windows} -lt 2 ]" "set status off"'

        set -g @catppuccin_flavour 'mocha'
        set -g @catppuccin_status_connect_separator "no"
        set -g @catppuccin_status_fill "icon"
        set -g @catppuccin_status_left_separator  " "
        set -g @catppuccin_status_modules "host session"
        set -g @catppuccin_status_right_separator ""
        set -g @catppuccin_status_right_separator_inverse "no"
        set -g @catppuccin_window_current_fill "number"
        set -g @catppuccin_window_current_text "#W"
        set -g @catppuccin_window_default_fill "number"
        set -g @catppuccin_window_default_text "#W"
        set -g @catppuccin_window_left_separator ""
        set -g @catppuccin_window_middle_separator " █"
        set -g @catppuccin_window_number_position "right"
        set -g @catppuccin_window_right_separator " "

        set -g allow-passthrough on
        set -g focus-events off
        set -g repeat-time 0
        set -g set-clipboard on
        set -ga terminal-overrides ",xterm*:RGB"
        set -ga update-environment TERM
        set -ga update-environment TERM_PROGRAM

        bind -n C-F3 set-option status
        bind '"' split-window -v -c "#{pane_current_path}"
        bind '%' split-window -h -c "#{pane_current_path}"
        bind -n M-Left previous-window
        bind -n M-Right next-window
        bind -n S-Left previous-window
        bind -n S-Right next-window
        bind -r -T prefix C-Down resize-pane -D 6
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
      '';
    };
  };
}
