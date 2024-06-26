{
  config,
  lib,
  pkgs,
  self,
  ...
}: let
  cfg = config.customPrograms.nheko;
  inherit (lib) mkEnableOption mkIf;
in {
  options.customPrograms.nheko.enable = mkEnableOption "";

  config = mkIf cfg.enable {
    age.secrets.nheko_access-token.file = "${self}/secrets/nheko_access-token.age";
    home.activation."nheko_access-token" = lib.hm.dag.entryAfter ["writeBoundary"] ''
      secret=$(cat "${config.age.secrets.nheko_access-token.path}")
      ${lib.getExe pkgs.gnused} -i \
        "s|@nheko_access-token@|$secret|" \
        ${config.xdg.configHome}/nheko/nheko.conf
    '';

    programs.nheko.enable = true;
    xdg.configFile."nheko/nheko.conf" = {
      force = true;
      text = ''
        [General]
        disable_certificate_validation=false

        [auth]
        access_token=@nheko_access-token@
        device_id=MEPTIAZACH
        home_server=https://matrix.envs.net:443
        user_id=@@errornointernet:envs.net

        [settings]
        scale_factor=1.000000

        [user]
        alert_on_notification=false
        animate_images_on_hover=false
        automatically_share_keys_with_trusted_users=false
        avatar_circles=false
        bubbles_enabled=false
        camera="BisonCam, NB Pro: BisonCam, NB"
        camera_frame_rate=30/1
        camera_resolution=640x480
        collapsed_spaces=@Invalid()
        currentProfile=
        decrypt_notificatons=true
        decrypt_sidebar=true
        desktop_notifications=true
        expose_dbus_api=false
        fancy_effects=true
        font_size=10
        group_view=true
        hidden_pins=@Invalid()
        hidden_tags=@Invalid()
        hidden_widgets=@Invalid()
        invert_enter_key=false
        markdown_enabled=true
        microphone=Built-in Audio Analog Stereo
        minor_events=true
        mobile_mode=false
        muted_tags=global
        online_key_backup=true
        only_share_keys_with_verified_users=false
        open_image_external=false
        open_video_external=false
        presence=AutomaticPresence
        privacy_screen=false
        privacy_screen_timeout=0
        read_receipts=true
        recent_reactions=@Invalid()
        reduced_motion=false
        ringtone=Default
        screen_share_frame_rate=5
        screen_share_hide_cursor=false
        screen_share_pip=true
        screen_share_remote_video=false
        scrollbars_in_roomlist=false
        sidebar\community_list_width=48
        sidebar\room_list_width=260
        small_avatars_enabled=false
        sort_by_unread=true
        space_notifications=true
        theme=system
        timeline\buttons=true
        timeline\enlarge_emoji_only_msg=false
        timeline\max_width=0
        timeline\message_hover_highlight=true
        typing_notifications=true
        use_identicon=true
        use_stun_server=false
        window\start_in_tray=false
        window\tray=true
      '';
    };
  };
}
