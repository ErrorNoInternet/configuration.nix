{
  # TODO: remove after https://github.com/fish-shell/fish-shell/issues/3635
  rum.programs.fish.config = /* fish */ ''
    function start_logout_timer --on-event fish_prompt
        if string match --quiet --regex --entire '^[1-9]+[0-9]*$' "$TMOUT"
            status job-control full
            if set --query __fish_tmout_pid
                kill -- -$__fish_tmout_pid
            end
            FISH_PID=%self sh -c "sleep $TMOUT; kill -HUP $FISH_PID" &
            disown
            set -gx __fish_tmout_pid $last_pid
        end
    end

    function stop_logout_timer --on-event fish_preexec
        if set --query __fish_tmout_pid
            kill -- -$__fish_tmout_pid
        end
        set --erase __fish_tmout_pid
    end
  '';
}
