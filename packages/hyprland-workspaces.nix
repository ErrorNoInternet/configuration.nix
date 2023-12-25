{pkgs}:
pkgs.rustPlatform.buildRustPackage rec {
  pname = "hyprland-workspaces";
  version = "1.2.5";
  cargoHash = "sha256-kUDo+6fsrzzojHYNMNBYpztGJPPtPp/OXUypUJnzebY=";
  src = pkgs.fetchFromGitHub {
    owner = "FieldOfClay";
    repo = pname;
    rev = "a0cfb35be67c98819cedb9646d55c2b3ddf4f7a5";
    hash = "sha256-5/add1VSJe5ChKi4UU5iUKRAj4kMjOnbB76QX/FkA6k=";
  };
}
