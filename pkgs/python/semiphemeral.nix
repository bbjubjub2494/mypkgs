{ lib, buildPythonPackage, fetchPypi, click, sqlalchemy, tweepy, flask, colorama }:

buildPythonPackage rec {
  pname = "semiphemeral";
  version = "0.5";
  src = fetchPypi {
    inherit pname version;
    sha256 = "0ixshai03idn0zxa8x4rvskd2v7n295wl5jkgs273958clxr2cyn";
  };

  propagatedBuildInputs = [click sqlalchemy tweepy flask colorama];

  meta = with lib; {
    description = "Automatically delete your old tweets, except for the ones you want to keep";
    homepage = https://micahflee.com/2019/06/semiphemeral-automatically-delete-your-old-tweets-except-for-the-ones-you-want-to-keep/;
    license = licenses.mit;
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