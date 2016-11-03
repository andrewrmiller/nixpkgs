{ stdenv, fetchurl, bashInteractive}:

stdenv.mkDerivation rec {
  name = "bashdb-${version}";
  version = "4.4-0.92";

  src = fetchurl {
    url = "mirror://sourceforge/project/bashdb/bashdb/${version}/${name}.tar.bz2";
    sha256 = "14mgp8nlygmrd7j8zh1gbgj7ha0fj7cv030sfdabjfa3w1ajd33a";
  };

  buildInputs = [ bashInteractive ];

  meta = {
    description = "A debugging tool for bash";
    homepage = http://bashdb.sourceforge.net/;
    license = stdenv.lib.licenses.gpl2;
    maintainers = [ stdenv.lib.maintainers.nixy ];
    platforms = stdenv.lib.platforms.all;
  };
}
