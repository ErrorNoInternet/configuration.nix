{ config, lib, ... }:
{
  boot.initrd.postResumeCommands = lib.mkAfter ''
    mkdir /impermanence_tmp
    mount /dev/disk/by-label/${config.host.name} /impermanence_tmp

    timestamp=$(date --date="@$(stat -c %Y /impermanence_tmp/@)" "+%Y-%m-%d_%H:%M:%S")
    if [[ -e /impermanence_tmp/@ ]]; then
        mkdir -p /impermanence_tmp/roots
        mv /impermanence_tmp/@ "/impermanence_tmp/roots/$timestamp"
    fi

    delete_subvolume_recursively() {
        IFS=$'\n'
        for i in $(btrfs subvolume list -o "$1" | cut -f 9- -d ' '); do
            delete_subvolume_recursively "/impermanence_tmp/$i"
        done
        btrfs subvolume delete "$1"
    }

    for i in $(find /impermanence_tmp/roots/ -maxdepth 1 -mtime +30); do
        delete_subvolume_recursively "$i"
    done

    btrfs subvolume create /impermanence_tmp/@
    umount /impermanence_tmp
  '';

  environment.persistence."/persist" = {
    enable = true;
    hideMounts = true;
    directories = [
      "/etc/mullvad-vpn"
      "/etc/ssh"
      "/mnt"
      "/var/db/sudo/lectured"
      "/var/lib/bluetooth"
      "/var/lib/nixos"
      "/var/lib/systemd/backlight"
      "/var/lib/systemd/coredump"
      "/var/log"
    ];
    files = [
      "/etc/machine-id"
    ];
  };

  services.openssh.hostKeys =
    let
      statePath = config.environment.persistence."/persist".persistentStoragePath + "/etc/ssh";
    in
    [
      {
        path = statePath + "/ssh_host_rsa_key";
        type = "rsa";
        bits = 4096;
      }
      {
        path = statePath + "/ssh_host_ed25519_key";
        type = "ed25519";
      }
    ];
}
