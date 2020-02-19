{ callPackage, fetchFromGitHub }:
let
  source = fetchFromGitHub {
    owner = "lourkeur";
    repo = "httpshare";
    rev = "a211034e53e13df2e62e89334c26f36fff72500d";  # 1.0.8
    sha256 = "154dkkwxqmrmn4s5mqvan6pv8ic6vrvf9vrlbal6i6bx3sc2cdf8";
  };
in
  callPackage (source + "/package.nix") {}
