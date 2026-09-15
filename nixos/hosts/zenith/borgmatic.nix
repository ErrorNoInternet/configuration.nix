{
  services.borgmatic = {
    enable = true;

    configurations.bastion = {
      ssh_command = "ssh -i /etc/ssh/ssh_host_ed25519_key";

      repositories = [
        {
          path = "ssh://error@bastion.error.tuxcord.net//mnt/backups/borg/zenith";
          label = "bastion";
        }
      ];

      source_directories = [
        "/persist"
      ];

      patterns = [
        "R /home"
        "+ /home/error/code/git/ErrorNoInternet"
        "- /home/error/code/git"
      ];

      exclude_patterns = [
        "*.pyc"
        "*/.snapshots"
        "*/.Trash-*"
        "*/.venv"
        "*/.vim*.tmp"
        "*/node_modules"
        "*/rpmbuild"
        "/home/*/.cache"
        "/home/*/.codex"
        "/home/*/.config/**/Cache"
        "/home/*/.config/**/Code Cache"
        "/home/*/.config/.android/avd"
        "/home/*/.go"
        "/home/*/.gradle"
        "/home/*/.local/share/Trash"
        "/home/*/.mypy_cache"
        "/home/*/.npm"
        "/home/*/.nv"
        "/home/*/.rustup"
        "/home/*/code/android/.old"
        "/home/*/code/android/sdk"
        "/persist/mnt"
        "/persist/var/lib/systemd/coredump"
      ];

      exclude_if_present = [
        ".nobackup"
      ];

      compression = "lz4";
      exclude_caches = true;
      one_file_system = true;

      keep_weekly = 4;
      keep_monthly = 6;
      keep_3monthly = 12;

      progress = true;
      statistics = true;
    };
  };
}
