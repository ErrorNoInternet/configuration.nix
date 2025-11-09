{
  files.".ssh/config".text = ''
    AddKeysToAgent 1d
    Compression yes
    VisualHostKey yes

    Host 100.96.0.1
      ForwardAgent yes

    Host errornointernet.tuxcord.net
      ForwardAgent yes

    Host minipi
      ForwardAgent yes

    Host pivot
      ForwardAgent yes

    Host tuxcord.net
      ForwardAgent yes

    Host zenith
      ForwardAgent yes
  '';
}
