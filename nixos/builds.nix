{
  nix.buildMachines = [
    {
      hostName = "tuxcord.net";
      maxJobs = 1;
      protocol = "ssh-ng";
      sshUser = "error";
      system = "x86_64-linux";
    }
  ];
}
