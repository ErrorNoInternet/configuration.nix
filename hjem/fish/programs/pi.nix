{
  rum.programs.fish = {
    abbrs = {
      pim = "pi --model";
      pir = "pi -r";
    };

    config = /* fish */ ''
      abbr -a --set-cursor -- pp "pi -p '%'"
    '';
  };
}
