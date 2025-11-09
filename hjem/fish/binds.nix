{
  rum.programs.fish.config = ''
    bind ctrl-\\ toggle-comment
    bind ctrl-\] "echo; cdh; commandline -f repaint"
    bind ctrl-alt-e 'commandline -rt -- (commandline -xt | string escape | string join " ")'
    bind ctrl-down history-token-search-forward
    bind ctrl-h backward-kill-word
    bind ctrl-up history-token-search-backward
  '';
}
