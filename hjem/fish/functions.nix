{ pkgs, ... }:
let
  inherit (pkgs.writers) writeFish;
in
{
  rum.programs.fish.functions = {
    bak = ''
      for argi in (seq 1 $(count $argv))
        cp -aiv $argv[$argi]{,.bak}
      end
    '';

    btrfs-map-physical = ''
      sudo command btrfs-map-physical $argv | column -ts\t
    '';

    cdd = ''
      cd (dirname $argv[1])
    '';

    g = ''
      vgrep --no-header $argv[1..] | fzf --ansi --bind "Ctrl-d:half-page-down,Ctrl-u:half-page-up" | awk '{print $1}' | xargs -I{} -o vgrep --show {}
    '';

    gitc = ''
      if test (count $argv) -lt 1
        echo "not enough arguments!"
        return
      end

      set last .
      for i in (seq (count $argv))
        set segments (string match -r "https://(.*)/(.*)/(.*)(/)?" (string trim -c/ $argv[$i]))
        if test (count $segments) -lt 4
          echo "invalid url: $argv[$i]"
          continue
        end

        set repo (string trim $segments[4])
        if string match -qr '\.git$' $repo
          set repo (string sub -s1 -e-4 $repo)
        end

        mkdir -p $segments[3]
        git clone $segments[1] $segments[3]/$repo
        set last $segments[3]/$repo
      end
      cd $last
    '';

    glfzf = writeFish "glfzf.fish" ''
      function glfzf -d "use fzf to preview git commits" --wraps "git log"
        git log --graph --color=always --format="%C(auto)%h%d %s %C(black)%C(bold)%cr" --abbrev=12 $argv | fzf --ansi --no-sort --reverse --tiebreak=index --scroll-off=5 --preview-window=right:60% \
          --preview 'function preview; git show -m --color=always (echo $argv | grep -o "[a-f0-9]\{12\}" | head -c12) | delta --width=(tput cols); end; preview {}' \
          --bind 'alt-j:preview-down,alt-k:preview-up,shift-down:preview-page-down,shift-up:preview-page-up,ctrl-m:execute:
                  function show; git show -m --color=always (echo $argv | grep -o "[a-f0-9]\{12\}" | head -c12) | delta --width=(tput cols) | less -R; end; show {}'
      end
    '';

    mb = ''
      read -sP "[luks] password for btank: " LUKS_PASSWORD
      echo
      echo "$LUKS_PASSWORD" | sudo cryptsetup luksOpen /dev/disk/by-uuid/63d74946-b1e7-4c3b-87a6-67bca2f6a096 luks_btank
      if [ "$status" != 0 ]
        echo "failed to unlock LUKS device"
        return
      end
      set -e LUKS_PASSWORD

      sudo mount -o compress=zstd:9 /dev/mapper/luks_btank /mnt/btank
    '';

    mkcd = ''
      command mkdir $argv
      if test $status = 0
        switch $argv[(count $argv)]
          case '-*'

          case '*'
            cd $argv[(count $argv)]
            return
        end
      end
    '';

    multicd = ''
      echo cd (string repeat -n (math (string length -- $argv) - 1) ../)
    '';

    notify-done = ''
      $argv
      notify-send "Command finished" "<b>`$argv`</b> has exited with code $status."
    '';

    pmem = ''
      for pid in (string replace -a " " \n $argv)
        echo $pid
        string match -re "VmRSS|VmSwap" < /proc/$pid/status |
            string replace -a " " "" |
            string replace -a "kB" "" |
            hsize -fk r
      end
    '';

    remove_path = ''
      set code 1
      if set -l index (contains -i "$argv" $fish_user_paths)
        set -e fish_user_paths[$index]
        set code 0
      end
      return $code
    '';

    res = ''
      for argi in (seq 1 $(count $argv))
        set name $argv[$argi]
        switch $name
        case "*.store"
        case "*"
          mv $name.store $name
          echo "$name <- $name.store"
        end
      end
    '';

    storesolve = ''
      argparse "d/directory" -- $argv

      for argi in (seq 1 (count $argv))
        set path (readlink -f "$argv[$argi]")
        if ! test -e "$path"
          set path (which "$argv[$argi]")
        end

        while test -L "$path"
          set path (readlink -f "$path")
        end

        if set -q _flag_directory
          while test (dirname "$path") != "/nix/store"
            set path (dirname "$path")
          end
        end

        echo "$path"
      end
    '';

    sudo = writeFish "sudo.fish" ''
      function sudo --wraps sudo
        for i in (seq 1 (count $argv))
          if command -q -- $argv[$i]
            command sudo $argv
            return
          else if functions -q -- $argv[$i]
            if test $i != 1
                set sudo_args $argv[..(math $i - 1)]
            end
            command sudo $sudo_args -E fish -C "source $(functions --no-details (functions | string split ', ') | psub)" -c '$argv' -- $argv[$i..]
            return
          end
        end

        command sudo $argv
      end
    '';

    toggle-comment = ''
      set cursor (commandline --cursor)
      set cmd (commandline -b)
      if string match -qr '^#' $cmd
        set cursor (math $cursor - 2)
        if test $cursor -lt 0
          set cursor 0
        end
        set cmd (string replace -r '^# *' ''' $cmd)
      else
        set cursor (math $cursor + 2)
        set cmd (string join ' ' '#' $cmd)
      end
      commandline -- $cmd
      commandline --cursor $cursor
    '';

    umb = ''
      sudo umount /mnt/btank
      sudo cryptsetup luksClose luks_btank
    '';

    uns = ''
      for argi in (seq 1 $(count $argv))
        set name $argv[$argi]
        mv $name $name.store
        cat $name.store > $name
        echo "$name -> $name.store"
        $EDITOR $name
      end
    '';

    unS = ''
      for argi in (seq 1 $(count $argv))
        set name $argv[$argi]
        mv $name $name.store
        cat $name.store > $name
        echo "$name -> $name.store"
      end
    '';

    y = writeFish "y.fish" ''
      function y --wraps yazi
        set tmp (mktemp -t "yazi-cwd.XXXXX")
        yazi $argv --cwd-file="$tmp"
        if set cwd (cat -- "$tmp"); and [ -n "$cwd" ]; and [ "$cwd" != "$PWD" ]
          cd -- "$cwd"
        end
        rm -f -- "$tmp"
      end
    '';

    _tide_item_jj = ''
      if not command -sq jj; or not jj root --quiet &>/dev/null
        return 1
      end

      set jj_status (jj log -r@ -n1 --no-graph --color always -T '
      separate(" ",
        surround(
          raw_escape_sequence(if(diff.files(), "'$(set_color yellow)'", "'$(set_color green)'")) ++ "(",
          raw_escape_sequence(if(diff.files(), "'$(set_color yellow)'", "'$(set_color green)'")) ++ ")",
          separate(" ",
            bookmarks.map(|x| if(
              x.name().substr(0, 10).starts_with(x.name()),
              x.name().substr(0, 10),
              x.name().substr(0, 9) ++ "…")
            ).join(" "),
            tags.map(|x| if(
              x.name().substr(0, 10).starts_with(x.name()),
              x.name().substr(0, 10),
              x.name().substr(0, 9) ++ "…")
            ).join(" "),
            raw_escape_sequence("'$(set_color green)'") ++ surround("\"", "\"",
              if(
                description.first_line().substr(0, 16).starts_with(description.first_line()),
                description.first_line().substr(0, 16),
                description.first_line().substr(0, 15) ++ "…"
              )
            ),
            change_id.shortest(),
            commit_id.shortest(),
            if(conflict, raw_escape_sequence("'$(set_color red)'") ++ "conflict"),
            if(divergent, raw_escape_sequence("'$(set_color red)'") ++ "divergent"),
            if(hidden, "hidden"),
          )
        ),
        if(
          diff.files(),
          raw_escape_sequence("'$(set_color yellow)'") ++ "!" ++ diff.files().len()
        ),
      )' | string trim)
      _tide_print_item jj $tide_jj_icon' ' "$jj_status"
    '';
  };
}
