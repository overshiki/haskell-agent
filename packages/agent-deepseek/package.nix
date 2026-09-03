{ mkDerivation, agent-core, agent-json, agent-responses
, agent-responses-types, base, bytestring, case-insensitive
, hspec, aeson, http-client, http-client-tls, http-conduit
, http-types, lib, retry, safe-exceptions, text, time
, wai, warp
}:
mkDerivation {
  pname = "agent-deepseek";
  version = "0.1.0.0";
  src = ./.;
  libraryHaskellDepends = [
    agent-core agent-json agent-responses agent-responses-types base
    bytestring http-client http-client-tls http-conduit http-types retry
    safe-exceptions text time
  ];
  testHaskellDepends = [
    aeson agent-core agent-json agent-responses agent-responses-types
    base bytestring case-insensitive hspec http-types retry text time
    wai warp
  ];
  description = "Haskell client for the DeepSeek Responses transport";
  license = lib.meta.getLicenseFromSpdxId "MIT";
}
