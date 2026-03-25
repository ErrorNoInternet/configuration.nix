{
  rum.programs.fish.config = /* fish */ ''
    function _custom_fish_key_bindings --on-variable fish_key_bindings
      bind --user ctrl-\\ toggle-comment
      bind --user ctrl-\] "echo; cdh; commandline -f repaint"
      bind --user ctrl-alt-e 'commandline -rt -- (commandline -xt | string escape | string join " ")'
      bind --user ctrl-down history-token-search-forward
      bind --user ctrl-h backward-kill-word
      bind --user ctrl-up history-token-search-backward
    end
  '';
}
