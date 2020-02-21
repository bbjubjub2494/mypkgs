self: super:

{
    python3 = super.python3.override {
        packageOverrides = self: super: {
            torchsummary = self.callPackage ./pkgs/python/torchsummary.nix {};
        };
    };

    httpshare = self.callPackage ./pkgs/httpshare.nix {};

    vscode-extensions = with self.vscode-utils; super.vscode-extensions // {
        scala-lang.scala = extensionFromVscodeMarketplace {
            name = "scala";
            publisher = "scala-lang";
            version = "0.3.8";
            sha256 = "17dl10m3ayf57sqgil4mr9fjdm7i8gb5clrs227b768pp2d39ll9";
          };
        vinrobot.vhdl-formatter = extensionFromVscodeMarketplace {
            name = "vhdl-formatter";
            publisher = "vinrobot";
            version = "1.0.4";
            sha256 = "115bsbfkrzk9n2018r1gm3cbird81cbk6n2dqd71xybiv8xib8c1";
          };
        lampepfl.dotty = extensionFromVscodeMarketplace {
            name = "dotty";
            publisher = "lampepfl";
            version = "0.1.16";
            sha256 = "0a331a49e76d90d326c7c05b2b003cb0c41764769815c76b3569439d991ee4d5";
          };
    };

    vscode = self.vscodium;
    vscode-with-extensions = super.vscode-with-extensions.override {
        vscodeExtensions = with self.vscode-extensions; [
          bbenoist.Nix
          vscodevim.vim
          scala-lang.scala
          lampepfl.dotty
          vinrobot.vhdl-formatter
        ];
    };

    git-with-tools = with self.gitAndTools; [ git git-absorb git-subrepo delta tig ];

    nur =
      let
        nur-source = builtins.fetchTarball {
          url = "https://github.com/nix-community/nur-combined/archive/a9182c53221855ba3614c529e99b2dceea7329b8.tar.gz";
          sha256 = "12h964822j3d7xdq9lx22h74qp6wvzhjibi4hppy0lnnppaxqhqw";
        };
      in
      import nur-source {
        pkgs = self;
        repoOverrides.lourkeur = import ../nur-expressions;
      };

      environments = {
        jupyter-cs233 = self.callPackage ./environments/jupyter-cs233.nix {};
    };
}
