{
  rum.programs.fish.abbrs = {
    jctl = "journalctl";
    jctlb = "journalctl -b";
    jctlbe = "journalctl -eb";
    jctle = "journalctl -e";
    jctleu = "journalctl -eu";
    jctlf = "journalctl -f";
    jctlke = "journalctl -ke";
    jctlu = "journalctl -u";
    jctlxeu = "journalctl -xeu";

    sc = "systemctl";
    scd = "systemctl disable";
    scdr = "systemctl daemon-reload";
    sce = "systemctl enable";
    scen = "systemctl enable --now";
    scl = "systemctl list-units";
    sclf = "systemctl list-units --failed";
    scR = "systemctl reload";
    scr = "systemctl restart";
    scrf = "systemctl reset-failed";
    scS = "systemctl start";
    scs = "systemctl status";
    sct = "systemctl stop";

    scu = "systemctl --user";
    scud = "systemctl --user disable";
    scudr = "systemctl --user daemon-reload";
    scue = "systemctl --user enable";
    scuen = "systemctl --user enable --now";
    scul = "systemctl --user list-units";
    sculf = "systemctl --user list-units --failed";
    scuR = "systemctl --user reload";
    scur = "systemctl --user restart";
    scurf = "systemctl --user reset-failed";
    scuS = "systemctl --user start";
    scus = "systemctl --user status";
    scut = "systemctl --user stop";
  };
}
