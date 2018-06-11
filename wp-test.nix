{ mkDerivation, aeson, base, bytestring, containers, hedgehog
, http-client, http-media, http-types, lens, mysql, servant
, servant-client, stdenv, tasty, tasty-hedgehog, text, time
}:
mkDerivation {
  pname = "wp-test";
  version = "0.1.0.0";
  src = ./.;
  libraryHaskellDepends = [
    aeson base containers http-media servant servant-client text time
  ];
  testHaskellDepends = [
    base bytestring hedgehog http-client http-types lens mysql
    servant-client tasty tasty-hedgehog text
  ];
  description = "Hedgehog state machine tests for WordPress";
  license = stdenv.lib.licenses.bsd3;
}
