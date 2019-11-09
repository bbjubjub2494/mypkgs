{ lib, buildPythonPackage, fetchFromGitHub, flask, flask-httpauth, stem, pyqt5, pycrypto, pysocks, gnome3, pytest, httpauth, requests, tor, obfs4 }:

buildPythonPackage {
  pname = "onionshare";
  version = "2.1";
  src = fetchFromGitHub {
    owner = "micahflee";
    repo = "onionshare";
    rev = "v2.1";
    sha256 = "1lx21p12888qnbhsyin4lrnn4xizb39ldk77r71y53hn8mfxi54z";
  };

  propagatedBuildInputs = [ flask flask-httpauth stem pyqt5 pycrypto pysocks gnome3.nautilus httpauth requests ];
  buildInputs = [ tor obfs4 ];
  checkInputs = [ pytest ];

  patches = [ ./nixify.patch ];

  # replace @tor@, @obfs4@, @geoip@ w/ store paths.
  inherit tor obfs4;
  inherit (tor) geoip;
  postPatch = "substituteAllInPlace onionshare/common.py";

  doCheck = false;  # need a $HOME

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
}
