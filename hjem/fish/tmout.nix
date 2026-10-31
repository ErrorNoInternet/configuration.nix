{
  # TODO: remove after https://github.com/fish-shell/fish-shell/issues/3635
  rum.programs.fish.config = /* fish */ ''
    function start_logout_timer --on-event fish_prompt
        if not set -q __fish_tmout_fifo
            if not set -q XDG_RUNTIME_DIR
                or not string match --quiet --regex '^[1-9]+[0-9]*$' "$TMOUT"
                return
            end
            set -g __fish_tmout_fifo "$XDG_RUNTIME_DIR/__fish_tmout_$fish_pid"
        end
        if not set -q __fish_tmout_pid
            or not test -d /proc/$__fish_tmout_pid
            status job-control full
            command mkfifo $__fish_tmout_fifo 2>/dev/null
            bash -c '
                count=0 busy= t=30
                exec 3<>"$2"
                while :; do
                    x=""
                    read -t $t x <&3 || :
                    kill -0 "$1" || break
                    case "$x" in
                        (busy) busy=1 ;;
                        ("") [ "$busy" ] || count=$((count + 1)) ;;
                        (*) busy= count=0 ;;
                    esac
                    [ "$count" -lt $(($3 / t)) ] && continue
                    kill -HUP "$1"
                    break
                done
                rm -f "$2"
            ' _ $fish_pid $__fish_tmout_fifo $TMOUT < /dev/null > /dev/null 2>&1 &
            disown
            set -g __fish_tmout_pid $last_pid
        end
        if test -p $__fish_tmout_fifo
            echo prompt > $__fish_tmout_fifo
        end
    end

    function pause_logout_timer --on-event fish_preexec
        if test -p $__fish_tmout_fifo
            echo busy > $__fish_tmout_fifo
        end
    end

    function stop_logout_timer --on-event fish_exit
        if set -q __fish_tmout_pid
            kill -- -$__fish_tmout_pid 2>/dev/null
        end
        if set -q __fish_tmout_fifo
            command rm -f $__fish_tmout_fifo
        end
    end
  '';
}
