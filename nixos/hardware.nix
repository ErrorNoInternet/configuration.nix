{
  boot = {
    initrd.availableKernelModules = [
      "nvme"
      "usbhid"
      "ahci"
      "ehci_pci"
      "rtsx_pci_sdmmc"
      "sd_mod"
      "sr_mod"
      "usb_storage"
      "virtio_blk"
      "virtio_pci"
      "virtio_scsi"
      "xhci_pci"
      "hid_asus"
    ];
    kernelModules = [ "kvm-intel" ];
  };

  hardware.enableRedistributableFirmware = true;
}
