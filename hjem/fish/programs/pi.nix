{
  rum.programs.fish = {
    abbrs = {
      pie = "pi -e";
      pil = "pi list";
      pim = "pi --model";
      pin = "pi --no-session";
      pinm = "pi --no-session --model";
      pir = "pi -r";
      piu = "pi update --extensions";
    };

    config = /* fish */ ''
      abbr -a --set-cursor -- pp "pi -p '%'"
    '';
  };
}
