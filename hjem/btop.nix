{
  osConfig,
  lib,
  ...
}:
{
  xdg.config.files."btop/btop.conf".text =
    with lib;
    generators.toINIWithGlobalSection
      {
        mkKeyValue = generators.mkKeyValueDefault {
          mkValueString =
            v:
            if builtins.isBool v && v then
              "True"
            else if builtins.isBool v && !v then
              "False"
            else if isString v then
              ''"${v}"''
            else
              generators.mkValueStringDefault { } v;
        } "=";
      }
      {
        globalSection = {
          color_theme =
            let
              inherit (osConfig.scheme) slug;
            in
            "${osConfig.programs.btop.package}/share/btop/themes/"
            + (
              if slug == "nord" then
                "nord.theme"
              else if slug == "kanagawa" then
                "kanagawa-wave.theme"
              else
                "onedark.theme"
            );

          disks_filter =
            "exclude="
            + (lib.strings.concatStringsSep " " (
              map (entry: entry.dirPath) osConfig.environment.persistence."/persist".directories
            ));

          background_update = true;
          base_10_bitrate = "Auto";
          base_10_sizes = false;
          check_temp = true;
          clock_format = "%X";
          cpu_bottom = false;
          cpu_core_map = "";
          cpu_graph_lower = "Auto";
          cpu_graph_upper = "Auto";
          cpu_invert_lower = true;
          cpu_sensor = "Auto";
          cpu_single_graph = false;
          custom_cpu_name = "";
          custom_gpu_name0 = "";
          custom_gpu_name1 = "";
          custom_gpu_name2 = "";
          custom_gpu_name3 = "";
          custom_gpu_name4 = "";
          custom_gpu_name5 = "";
          disk_free_priv = false;
          force_tty = false;
          gpu_mirror_graph = true;
          graph_symbol = "braille";
          graph_symbol_cpu = "default";
          graph_symbol_gpu = "default";
          graph_symbol_mem = "default";
          graph_symbol_net = "default";
          graph_symbol_proc = "default";
          io_graph_combined = false;
          io_graph_speeds = "";
          io_mode = false;
          log_level = "WARNING";
          mem_below_net = false;
          mem_graphs = true;
          net_auto = true;
          net_download = 100;
          net_sync = true;
          net_upload = 100;
          nvml_measure_pcie_speeds = true;
          only_physical = true;
          presets = "cpu:1:default,proc:0:default";
          proc_aggregate = false;
          proc_colors = true;
          proc_cpu_graphs = true;
          proc_filter_kernel = false;
          proc_gradient = false;
          proc_info_smaps = false;
          proc_left = false;
          proc_mem_bytes = true;
          proc_per_core = false;
          proc_reversed = false;
          proc_sorting = "cpu direct";
          proc_tree = false;
          rounded_corners = true;
          rsmi_measure_pcie_speeds = true;
          selected_battery = "Auto";
          show_battery = true;
          show_battery_watts = true;
          show_coretemp = true;
          show_cpu_freq = true;
          show_cpu_watts = true;
          show_disks = true;
          show_gpu_info = "Off";
          show_io_stat = true;
          show_swap = true;
          show_uptime = true;
          shown_boxes = "cpu mem net proc gpu0";
          swap_disk = false;
          temp_scale = "celsius";
          theme_background = false;
          truecolor = true;
          update_ms = 1000;
          use_fstab = true;
          vim_keys = true;
          zfs_arc_cached = true;
          zfs_hide_datasets = false;
        };
      };
}
