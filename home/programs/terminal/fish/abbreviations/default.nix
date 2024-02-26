{
  imports = [
    ./git.nix
    ./mullvad.nix
    ./nix.nix
  ];

  programs.fish.shellAbbrs = {
    "...." = "../..";
    "......" = "../../..";
    "........" = "../../../..";
    ".........." = "../../../../..";
    "............" = "../../../../../..";

    e = "echo";
    nv = "nvim";
    p = "printf";
    s = "sudo";
    sc = "systemctl";
    scu = "systemctl --user";

    clo = "curl -LO";
    wr = "wf-recorder -b 0 -c h264_nvenc -p b=5M -f recording_(date \"+%Y-%m-%-d_%H:%M:%S\").mp4";
  };
}
