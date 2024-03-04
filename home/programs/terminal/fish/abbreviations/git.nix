{
  programs.fish.shellAbbrs = {
    "ga." = "git add .";
    "gl." = "git log .";
    "gr." = "git restore .";
    g = "git";
    ga = "git add";
    gap = "git add -p";
    gb = "git branch";
    gbd = "git branch -d";
    gbD = "git branch -D";
    gbl = "git blame";
    gbr = "git branch -r";
    gc = "git commit -m";
    gC = "git commit -m";
    gca = "git commit --amend";
    gcf = "git clean -f .";
    gcfx = "git clean -fX .";
    gch = "git cherry";
    gcl = "git clone";
    gco = "git checkout";
    gcob = "git checkout -b";
    gcp = "git cherry-pick";
    gcpa = "git cherry-pick --abort";
    gcpc = "git cherry-pick --continue";
    gcps = "git cherry-pick --skip";
    gd = "git diff";
    gdc = "git diff --compact-summary";
    gds = "git diff --staged";
    gl = "git log";
    glf = "git log --follow";
    gm = "git merge";
    gma = "git merge --abort";
    gmc = "git merge --continue";
    gmn = "git merge --no-commit";
    gp = "git push";
    gpa = "git push --all";
    gpf = "git push --force-with-lease";
    gpl = "git pull";
    gpo = "git push origin";
    gpod = "git push origin --delete";
    gps = "git push -u origin";
    gr = "git restore";
    grb = "git rebase -i";
    grbc = "git rebase --continue";
    grh = "git reset HEAD";
    grh1 = "git reset HEAD~1";
    grp = "git restore -p";
    grr = "git restore --recurse-submodules";
    grv = "git revert";
    grva = "git revert --abort";
    grvc = "git revert --continue";
    grvn = "git revert --no-commit";
    gs = "git show";
    gst = "git status";
    gsw = "git switch -";
  };
}
