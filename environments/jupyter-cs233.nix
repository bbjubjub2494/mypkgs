{ mkShell, python3Packages }:
mkShell {
  buildInputs = with python3Packages; [ jupyter scipy matplotlib scikitlearn pandas pytorch torchvision torchsummary ];
}
