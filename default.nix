self: super:

{
    python3 = super.python3.override {
        packageOverrides = self: super: {
            torchsummary = self.callPackage ./pkgs/python/torchsummary.nix {};
        };
    };

    environments = {
        jupyter-cs233 = self.callPackage ./environments/jupyter-cs233.nix {};
    };
}
