{ mkDerivation, aeson, base, bytestring, containers, dependent-map
, dependent-sum, dependent-sum-template, deriving-compat, ghc-prim
, hedgehog, http-api-data, http-client, http-media, http-types
, lens, mysql, process, servant, servant-client, stdenv, tasty
, tasty-hedgehog, template-haskell, text, time
, unordered-containers
}:
mkDerivation {
  pname = "wp-test";
  version = "0.1.0.0";
  src = ./.;
  libraryHaskellDepends = [
    aeson base containers dependent-map dependent-sum
    dependent-sum-template deriving-compat ghc-prim http-api-data
    http-media lens servant servant-client template-haskell text time
    unordered-containers
  ];
  testHaskellDepends = [
    aeson base bytestring containers dependent-map dependent-sum
    hedgehog http-client http-types lens mysql process servant
    servant-client tasty tasty-hedgehog text time
  ];
  description = "Hedgehog state machine tests for WordPress";
  license = stdenv.lib.licenses.bsd3;
}
