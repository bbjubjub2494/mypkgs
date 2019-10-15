self: super:

{
    python3 = super.python3.override {
        packageOverrides = self: super: {
            torchsummary = self.callPackage ./pkgs/python/torchsummary.nix {};
            semiphemeral = self.callPackage ./pkgs/python/semiphemeral.nix {};
            onionshare = self.callPackage ./pkgs/python/onionshare.nix {};
        };
    };

    httpshare = self.callPackage ./pkgs/httpshare.nix {};

    semiphemeral = with self.python3Packages; toPythonApplication semiphemeral;
    onionshare = with self.python3Packages; toPythonApplication onionshare;

    environments = {
        jupyter-cs233 = self.callPackage ./environments/jupyter-cs233.nix {};
    };
}
