{
  config,
  lib,
  osConfig,
  pkgs,
  ...
}: let
  cfg = config.customPrograms.kdeconnect;
  inherit (lib) mkDefault mkEnableOption mkOption mkIf types;
  inherit (lib.generators) toINI;
in {
  options.customPrograms.kdeconnect = {
    enable = mkEnableOption "";

    enableYaziIntegration =
      mkEnableOption "" // {default = true;};

    deviceId = mkOption {
      default = "6ded058eb2e79440";
      type = types.str;
    };
  };

  config = mkIf cfg.enable {
    services.kdeconnect.enable = mkDefault true;

    xdg.configFile = {
      "kdeconnect/config".text = toINI {} {General = {inherit (osConfig.host) name;};};

      "kdeconnect/${cfg.deviceId}/kdeconnect_runcommand/config".text = ''
        [General]
        commands="@ByteArray({
          \"_06229304_9fe8_440b_b731_d27b1602cbd0_\": {\"command\":\"hyprctl dispatch dpms off\",           \"name\":\"DPMS off\"},
          \"_2d7befd0_a3dc_43fa_b482_3becdf6902b8_\": {\"command\":\"hyprctl dispatch workspace previous\", \"name\":\"Workspace previous\"},
          \"_2db836a0_3802_4a5d_9771_b951a085ee3d_\": {\"command\":\"hyprctl dispatch workspace +1\",       \"name\":\"Workspace +1\"},
          \"_4651899c_1012_4fc9_8484_0e095fcc214b_\": {\"command\":\"swaylock --grace 0 --fade-in 1\",      \"name\":\"Lock screen\"},
          \"_a33de15f_5418_46da_86a5_06f4c9943b07_\": {\"command\":\"hyprctl dispatch killactive\",         \"name\":\"Kill active\"},
          \"_af876aa7_0496_4823_840d_7cc8ca74c0a8_\": {\"command\":\"hyprctl dispatch workspace -1\",       \"name\":\"Workspace -1\"},
          \"_fb99f80b_7a0d_43c5_baa5_7bc309867148_\": {\"command\":\"hyprctl dispatch dpms on\",            \"name\":\"DPMS on\"},
          \"_8497c288-9dba-4644-b52d-c3f993b57c40_\": {\"command\":\"scratchpad\",                          \"name\":\"Send to scratchpad\"},
          \"_73ba3988-73b7-4b95-af69-b3a82ba17db7_\": {\"command\":\"scratchpad -g\",                       \"name\":\"Get from scratchpad\"}
        })"
      '';
    };

    programs.yazi.keymap.manager.keymap = mkIf cfg.enableYaziIntegration [
      {
        on = ["E"];
        run = "shell --confirm --block '${pkgs.kdeconnect}/bin/kdeconnect-cli -d ${cfg.deviceId} --share \"$@\"; read'";
        desc = "send file to ${cfg.deviceId} using KDE Connect";
      }
    ];
  };
}
