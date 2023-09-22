{ pkgs, ... }:

{
    networking.hostName = "Pix";
    environment.variables.HOSTNAME = "Pix";

    networking.firewall.allowedTCPPorts = [
        # NFS server
        2049
    ];

    fileSystems = {
        "/mnt/drive1" = {
            device = "/dev/disk/by-uuid/fc102db2-60b8-43e1-8b21-40a589edfdda";
            fsType = "btrfs";
            options = [ "x-systemd.automount" "noauto" ];
        };
        "/export/drive1" = {
            device = "/mnt/drive1";
            options = [ "bind" ];
        };
        "/mnt/drive3" = {
            device = "/dev/disk/by-uuid/6a03c0f9-5c76-4a08-9091-aba7239a6429";
            fsType = "btrfs";
            options = [ "x-systemd.automount" "noauto" ];
        };
        "/export/drive3" = {
            device = "/mnt/drive3";
            options = [ "bind" ];
        };
    };

    services.nfs.server = {
        enable = true;
        exports = ''
            /mnt/drive1 localhost(rw,sync,no_subtree_check,no_root_squash)
            /mnt/drive3 localhost(rw,sync,no_subtree_check,no_root_squash)
            /mnt/drive1 192.168.0.101(rw,sync,no_subtree_check,no_root_squash)
            /mnt/drive3 192.168.0.101(rw,sync,no_subtree_check,no_root_squash)
        '';
    };
}
