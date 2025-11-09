{
  pkgs,
  writeShellApplication,
  ...
}:
writeShellApplication {
  name = "hyprtoggle";

  runtimeInputs = [ pkgs.hyprland ];

  text = ''
    #!/usr/bin/env sh

    if [ "$#" -lt 1 ]; then
        echo "not enough arguments"
        exit 1
    fi

    VARIABLE="$1"
    export STATUS_FILE="$XDG_RUNTIME_DIR/hyprland_$VARIABLE"

    set_true() {
    	printf "true" >"$STATUS_FILE"
    	hyprctl keyword \$"$VARIABLE" "true" -r
    }

    set_false() {
    	printf "false" >"$STATUS_FILE"
    	hyprctl keyword \$"$VARIABLE" "false" -r
    }

    if ! [ -f "$STATUS_FILE" ]; then
    	set_false
    else
    	if [ "$(cat "$STATUS_FILE")" = "true" ]; then
    		set_false
    	elif [ "$(cat "$STATUS_FILE")" = "false" ]; then
    		set_true
    	fi
    fi
  '';
}
