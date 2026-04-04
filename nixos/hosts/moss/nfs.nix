{
  services.nfs.server = {
    enable = true;

    exports = ''
      /export/error   192.168.0.143(rw) 192.168.0.213(rw) 192.168.0.246(rw)
    '';
  };
}
