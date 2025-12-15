{
  rum.programs.fish = {
    abbrs = {
      "je+" = "jj edit @+";
      "jR." = "jj restore .";
      "js+" = "jj show @+";
      j = "jj";
      ja = "jj abandon";
      jb = "jj bookmark";
      jbm = "jj bookmark move";
      jC = "jj commit";
      jci = "jj commit -i";
      jD = "jj diff";
      jde = "jj desc --edit";
      jde- = "jj desc --edit @-";
      jde-- = "jj desc --edit @--";
      jde--I = "jj desc --edit @-- --ignore-immutable";
      jde-I = "jj desc --edit @- --ignore-immutable";
      je = "jj edit";
      jE = "jj evolog";
      je- = "jj edit @-";
      je-- = "jj edit @--";
      je--I = "jj edit @-- --ignore-immutable";
      je-I = "jj edit @- --ignore-immutable";
      jel = "jj edit \"latest(@::)\"";
      jev = "jj evolog -p";
      jf = "jj git fetch";
      jfa = "jj file annotate";
      jl = "jj log -r :: -n 10";
      jll = "jj log -r ::";
      jllp = "jj log -r :: -p";
      jlls = "jj log -r :: --stat";
      jlp = "jj log -r :: -n 10 -p";
      jls = "jj log -r :: -n 10 --stat";
      jn = "jj new";
      jnl = "jj new \"latest(@::)\"";
      jop = "jj op log";
      jp = "jj git push";
      jpb = "jj git push -b";
      jpg = "jj git push --remote gitea";
      jpl = "jj fetch && jj rebase -d main";
      jpn = "jj git push --allow-new";
      jR = "jj restore";
      jRb = "jj rebase";
      jRbd = "jj rebase -d";
      jRi = "jj restore -i";
      jRr = "jj restore -f@ -t@-";
      js = "jj show";
      jS = "jj split";
      js- = "jj show @-";
      js-- = "jj show @--";
      jsq = "jj squash";
      jsqI = "jj squash --ignore-immutable";
      jsqi = "jj squash -i";
      jss = "jj show --stat";
      jsS = "jj show -s";
      jss- = "jj show --stat @-";
      jsS- = "jj show -s @-";
      jss-- = "jj show --stat @--";
      jsS-- = "jj show -s @--";
      jst = "jj status";
      jt = "jj tug";
      jtp = "jj tug && jj git push";
      ju = "jj undo";
    };

    config = ''
      abbr -a --set-cursor -- jc 'jj commit -m "%"'
      abbr -a --set-cursor -- jd 'jj desc -m "%"'
      abbr -a --set-cursor -- jd- 'jj desc -m "%" @-'
    '';
  };
}
