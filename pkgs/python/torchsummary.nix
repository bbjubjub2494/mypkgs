{
  buildPythonPackage,
  fetchPypi,
  six,
  numpy,
  pillow,
  pytorch,
}:

buildPythonPackage rec {
  version = "1.5.1";
  pname   = "torchsummary";
  name    = "${pname}-${version}";

  format = "wheel";

  src = fetchPypi {
    inherit pname version;
    format = "wheel";
    python = "py3";
    sha256 = "10f41d1743fb918f83293f13183f532ab1bb8f6639a1b89e5f8592ec1919a976";
  };

  propagatedBuildInputs = [ six numpy pillow pytorch ];
}
