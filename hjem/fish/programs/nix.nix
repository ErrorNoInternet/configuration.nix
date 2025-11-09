{
  rum.programs.fish = {
    abbrs = {
      "nre." = "nix repl .";
      n = "nix";
      nB = "nix build";
      nBl = "nix build -L";
      nd = "nix develop -c fish";
      nD = "nix develop";
      nDl = "nix develop -L -c fish";
      ndl = "nix develop -L";
      nf = "nix flake";
      nfc = "nix flake check";
      nfca = "nix flake check --all-systems";
      nfl = "nix flake lock";
      nfm = "nix flake metadata";
      nfmt = "nix fmt";
      nfs = "nix flake show";
      nfu = "nix flake update";
      nL = "nix log";
      nr = "nix run";
      nre = "nix repl";
      nrl = "nix run -L";
      ns = "nix shell";
      nS = "nix-shell --run fish -p";
      nsl = "nix shell -L";
      nSS = "nix-shell --run fish";
      nst = "nix-store";
      nstq = "nix-store -q";
      nstr = "nix-store -r";
    };

    config = ''
      abbr -a --position anywhere -- /insecure "NIXPKGS_ALLOW_INSECURE=1"
      abbr -a --position anywhere -- /unfree "NIXPKGS_ALLOW_UNFREE=1"
      abbr -a --position anywhere -- /unsupported "NIXPKGS_ALLOW_UNSUPPORTED_SYSTEM=1"

      abbr -a --position anywhere -- /c "-c fish"
      abbr -a --position anywhere -- /es "--extra-substituters"
      abbr -a --position anywhere -- /etpk "--extra-trusted-public-keys"
      abbr -a --position anywhere -- /i "--impure"
      abbr -a --position anywhere -- /msj "--max-substitution-jobs"
      abbr -a --position anywhere -- /ncnt "--narinfo-cache-negative-ttl 0"
      abbr -a --position anywhere -- /nec "--no-eval-cache"
      abbr -a --position anywhere -- /o "--option"
      abbr -a --position anywhere -- /s "--substituters"
      abbr -a --position anywhere -- /st "--show-trace"
      abbr -a --position anywhere -- /tpk "--trusted-public-keys"
    '';
  };
}
