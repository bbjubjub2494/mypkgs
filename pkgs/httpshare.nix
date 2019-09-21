{ callPackage }:
let
  source = (fetchGit {
    url = "https://github.com/lourkeur/httpshare";
    name = "httpshare-source";
  }).outPath;
in
  callPackage (source + "/package.nix") {}