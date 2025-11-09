{ osConfig, ... }:
{
  rum.programs.fish.config = with osConfig.scheme; ''
    if not set -q FISH_THEME_CONFIGURED
      set -U FISH_THEME_CONFIGURED 1

      set -U fish_color_autosuggestion brblack
      set -U fish_color_command yellow
      set -U fish_color_comment gray
      set -U fish_color_keyword white --bold
      set -U fish_color_param white
      set -U fish_greeting

      tide configure --auto \
        --style=Lean \
        --prompt_colors='16 colors' \
        --show_time='24-hour format' \
        --lean_prompt_height='One line' \
        --prompt_spacing=Sparse \
        --icons='Few icons' \
        --transient=No

      set -U tide_character_color yellow
      set -U tide_color_truncated_dirs white
      set -U tide_pwd_color_anchors white
      set -U tide_pwd_color_dirs white
      set -U tide_pwd_color_truncated_dirs white
      set -U tide_left_prompt_items pwd git jj character
      set -U tide_right_prompt_items  status cmd_duration context jobs direnv \
                      node python rustc java php ruby go zig \
                      distrobox toolbox

      tide reload
    end

    function set_tty_theme -d "apply theme to TTY"
      argparse r/reset -- $argv

      if set -q _flag_reset
        reset
      else
        echo -e "
          \e]P0${base01}
          \e]P1${base08}
          \e]P2${base0B}
          \e]P3${base0A}
          \e]P4${base0D}
          \e]P5${base0E}
          \e]P6${base0C}
          \e]P7${base05}
          \e]P8${base03}
          \e]P9${base12}
          \e]PA${base14}
          \e]PB${base13}
          \e]PC${base16}
          \e]PD${base17}
          \e]PE${base15}
          \e]PF${base07}
          \e[16;1000]
        "
        clear
      end
    end
  '';
}
