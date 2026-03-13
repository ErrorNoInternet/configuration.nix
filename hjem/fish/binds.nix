{
  rum.programs.fish.config = ''
    bind --user ctrl-\\ toggle-comment
    bind --user ctrl-\] "echo; cdh; commandline -f repaint"
    bind --user ctrl-alt-e 'commandline -rt -- (commandline -xt | string escape | string join " ")'
    bind --user ctrl-down history-token-search-forward
    bind --user ctrl-h backward-kill-word
    bind --user ctrl-up history-token-search-backward
  '';
}
