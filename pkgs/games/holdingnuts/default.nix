{ lib, stdenv, fetchurl, cmake, SDL, qt4 }:

let mirror = "http://download.holdingnuts.net";
in stdenv.mkDerivation rec {
  pname   = "holdingnuts";
  version = "0.0.5";

  src = fetchurl {
    url    = "${mirror}/release/${version}/${pname}-${version}.tar.bz2";
    sha256 = "0iw25jmnqzscg34v66d4zz70lvgjp4l7gi16nna6491xnqha5a8g";
  };

  patches = [
    (fetchurl {
      url    = "${mirror}/patches/holdingnuts-0.0.5-wheel.patch";
      sha256 = "0hap5anxgc19s5qi64mjpi3wpgphy4dqdxqw34q19dw3gwxw5g8n";
    })
    (fetchurl {
      url    = "${mirror}/patches/holdingnuts-qpixmapcache-workaround.patch";
      sha256 = "15cf9j9mdm85f0h7w5f5852ic7xpim0243yywkd2qrfp37mi93pd";
    })
  ];

  postPatch = ''
    substituteInPlace src/system/SysAccess.c --replace /usr/share $out/share
  '';

  nativeBuildInputs = [ cmake ];
  buildInputs = [ SDL qt4 ];

  meta = with lib; {
    homepage    = "http://www.holdingnuts.net/";
    description = "Open Source Poker client and server";
    license     = licenses.gpl3;
    maintainers = with maintainers; [ obadz ];
    platforms   = platforms.all;
  };
}
