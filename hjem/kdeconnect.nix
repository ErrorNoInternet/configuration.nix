{ lib, osConfig, ... }:
{
  xdg.config.files = lib.mkIf osConfig.graphical.enable {
    "kdeconnect/config".text = ''
      [General]
      keyAlgorithm=EC
      name=${osConfig.host.name}
    '';

    "kdeconnect/58058debba2e4c33be2f30ae76ad28ea/kdeconnect_runcommand/config".text =
      if osConfig.host.name == "zenith" then
        ''
          [General]
          commands="@ByteArray({\"196dec4b_b358_4dd6_abbc_41aaba21ecfd\":{\"command\":\"hyprctl dispatch togglespecialworkspace scratchpad\",\"name\":\"Workspace scratchpad\"},\"1addd0f6_4726_4921_8800_91bd574a1157\":{\"command\":\"noctalia-shell ipc call calendar toggle\",\"name\":\"Calendar\"},\"215b77cd_8d92_41d5_877a_930024dc7210\":{\"command\":\"brightnessctl -d asus::kbd_backlight s 1%+\",\"name\":\"Keyboard brightness +1\"},\"3536b728_20ab_4ac2_ab51_2b8d5d3e55c5\":{\"command\":\"noctalia-shell ipc call launcher toggle\",\"name\":\"Launcher\"},\"3dfb4f47_6e26_4647_a566_d7023ca4c9dd\":{\"command\":\"hyprctl dispatch togglespecialworkspace communication\",\"name\":\"Workspace communication\"},\"41b29980_e1f0_4c22_9709_00caf8128384\":{\"command\":\"noctalia-shell ipc call notifications toggleHistory\",\"name\":\"Notifications\"},\"4d339e68_8c54_4e5a_8e63_46b7386b087a\":{\"command\":\"kill -9 hyprpicker\",\"name\":\"Kill hyprpicker\"},\"88c9654b_61ad_48e4_bcb8_689aa3593695\":{\"command\":\"noctalia-shell ipc call brightness decrease\",\"name\":\"Brightness -5\"},\"8ac16b84_43fb_4b31_a83b_32ee62f113a8\":{\"command\":\"noctalia-shell ipc call controlCenter toggle\",\"name\":\"Control center\"},\"_06229304_9fe8_440b_b731_d27b1602cbd0_\":{\"command\":\"hyprctl dispatch dpms off\",\"name\":\"DPMS off\"},\"_2d7befd0_a3dc_43fa_b482_3becdf6902b8_\":{\"command\":\"hyprctl dispatch workspace previous\",\"name\":\"Workspace previous\"},\"_2db836a0_3802_4a5d_9771_b951a085ee3d_\":{\"command\":\"hyprctl dispatch workspace +1\",\"name\":\"Workspace +1\"},\"_4651899c_1012_4fc9_8484_0e095fcc214b_\":{\"command\":\"loginctl lock-session\",\"name\":\"Lock screen\"},\"_73ba3988-73b7-4b95-af69-b3a82ba17db7_\":{\"command\":\"scratchpad -g\",\"name\":\"Get from scratchpad\"},\"_8497c288-9dba-4644-b52d-c3f993b57c40_\":{\"command\":\"scratchpad\",\"name\":\"Send to scratchpad\"},\"_a33de15f_5418_46da_86a5_06f4c9943b07_\":{\"command\":\"hyprctl dispatch killactive\",\"name\":\"Kill active\"},\"_af876aa7_0496_4823_840d_7cc8ca74c0a8_\":{\"command\":\"hyprctl dispatch workspace -1\",\"name\":\"Workspace -1\"},\"_fb99f80b_7a0d_43c5_baa5_7bc309867148_\":{\"command\":\"hyprctl dispatch dpms on\",\"name\":\"DPMS on\"},\"c3705c78_4edc_4c93_9c85_af459b2cfe87\":{\"command\":\"noctalia-shell ipc call brightness increase\",\"name\":\"Brightness +5\"},\"dd2bc00c_d4a0_4637_bbec_2b11a36a750c\":{\"command\":\"brightnessctl -d asus::kbd_backlight s 1%-\",\"name\":\"Keyboard brightness -1\"},\"e943088d_42b6_4853_b94e_1c7786a51c27\":{\"command\":\"noctalia-shell ipc call sessionMenu toggle\",\"name\":\"Session menu\"},\"f88f3152_da21_4058_8f7f_75f0166a0f64\":{\"command\":\"noctalia-shell ipc call screenRecorder toggle\",\"name\":\"Screen recorder\"}})"
        ''
      else
        "";
  };
}
