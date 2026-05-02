{
  nix.buildMachines = [
    {
      hostName = "tuxcord.net";
      maxJobs = 2;
      protocol = "ssh-ng";
      sshUser = "error";
      supportedFeatures = [ "big-parallel" ];
      system = "x86_64-linux";
    }
  ];
}
