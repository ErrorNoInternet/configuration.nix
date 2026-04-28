{
  lib,
  pkgs,
  self,
  ...
}:
let
  python = pkgs.python3;
in
python.pkgs.buildPythonApplication rec {
  pname = "endcord";
  inherit (self.pins.endcord) version;

  src = self.pins.endcord;
  pyproject = false;

  nativeBuildInputs = with python.pkgs; [
    cython
    setuptools
    pkgs.makeWrapper
  ];

  propagatedBuildInputs = with python.pkgs; [
    certifi
    emoji
    filetype
    numpy
    orjson
    protobuf
    psutil
    pycryptodome
    pynacl
    pysocks
    python-socks
    qrcode
    soundcard
    soundfile
    urllib3
    websocket-client
  ];

  buildPhase = ''
    runHook preBuild
    ${python.interpreter} setup.py build_ext --inplace
    runHook postBuild
  '';

  installPhase = ''
    runHook preInstall

    mkdir -p $out/${python.sitePackages}
    cp -r endcord endcord_cython $out/${python.sitePackages}/
    find . -maxdepth 2 -name "*.so" -exec cp {} $out/${python.sitePackages}/endcord_cython/ \;

    mkdir -p $out/lib/endcord
    cp -r themes $out/lib/endcord/
    cp main.py $out/lib/endcord/

    mkdir -p $out/bin
    makeWrapper ${python.interpreter} $out/bin/endcord \
      --add-flags "$out/lib/endcord/main.py" \
      --set PYTHONPATH "$out/${python.sitePackages}:${python.pkgs.makePythonPath propagatedBuildInputs}"

    runHook postInstall
  '';

  dontCheckRuntimeDeps = true;

  meta = {
    description = "Feature rich Discord TUI client";
    homepage = "https://github.com/sparklost/endcord";
    license = lib.licenses.gpl3Only;
    mainProgram = "endcord";
  };
}
