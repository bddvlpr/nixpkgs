{
  buildOctavePackage,
  lib,
  fetchurl,
  nan, # > 3.0.0
}:

buildOctavePackage rec {
  pname = "tsa";
  version = "4.6.3";

  src = fetchurl {
    url = "mirror://sourceforge/octave/${pname}-${version}.tar.gz";
    sha256 = "1pbxq77xc7pn0ki6rpijlq9v7inn0hn2adkx1skgwffl7pivrwsl";
  };

  requiredOctavePackages = [
    nan
  ];

  meta = {
    homepage = "https://gnu-octave.github.io/packages/tsa/";
    license = lib.licenses.gpl3Plus;
    maintainers = with lib.maintainers; [ KarlJoad ];
    description = "Stochastic concepts and maximum entropy methods for time series analysis";
  };
}
