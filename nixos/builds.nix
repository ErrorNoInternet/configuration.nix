{
  nix = {
    extraOptions = /* ini */ ''
      builders-use-substitutes = true
    '';

    buildMachines = [
      {
        hostName = "tuxcord.net";
        maxJobs = 2;
        protocol = "ssh-ng";
        speedFactor = 2;
        sshUser = "error";
        supportedFeatures = [ "big-parallel" ];
        system = "x86_64-linux";
      }
      {
        hostName = "38.49.218.24";
        maxJobs = 1;
        protocol = "ssh-ng";
        speedFactor = 1;
        sshUser = "root";
        supportedFeatures = [ "big-parallel" ];
        system = "x86_64-linux";
      }
    ];
  };
}
