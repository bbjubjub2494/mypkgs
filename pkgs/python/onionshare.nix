{ lib, buildPythonPackage, fetchFromGitHub, flask, stem, pyqt5, pycrypto, pysocks, gnome3, pytest, httpauth, requests }:

buildPythonPackage {
  name = "onionshare";
  version = "2.1";
  src = fetchFromGitHub {
    owner = "micahflee";
    repo = "onionshare";
    rev = "v2.1";
    sha256 = "1lx21p12888qnbhsyin4lrnn4xizb39ldk77r71y53hn8mfxi54z";
  };

  propagatedBuildInputs = [ flask stem pyqt5 pycrypto pysocks gnome3.nautilus pytest httpauth requests ];

  meta = with lib; {
    description = "OnionShare lets you securely and anonymously send and receive files";
    homepage = https://onionshare.org/;
    license = licenses.gpl3;
    maintainers = [
      {
        name = "Micah Lee";
        email = "micah@micahflee.com";
        github = "micahflee";
        githubId = 156128;
      }
    ];
  };

  doCheck = false;
}