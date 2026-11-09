{
  rum.programs.fish = {
    abbrs = {
      pim = "pi --model";
      pin = "pi --no-session";
      pinm = "pi --no-session --model";
      pir = "pi -r";
    };

    config = /* fish */ ''
      abbr -a --set-cursor -- pp "pi -p '%'"
    '';
  };
}
