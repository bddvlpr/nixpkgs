{
  lib,
  callPackage,
  buildDotnetModule,
  fetchFromGitHub,
  dotnetCorePackages,
  glib,
  gst_all_1,
  libv4l,
  onnxruntime,
  udev,
}:
let
  dotnet = dotnetCorePackages.dotnet_10;
in
buildDotnetModule {
  pname = "baballonia";
  version = "1.1.1.0-unstable-2026-06-21";

  src = fetchFromGitHub {
    owner = "Project-Babble";
    repo = "Baballonia";
    rev = "4a69127adb3263a6547c3282e2c9cebd485f9b99";
    fetchSubmodules = true;
    hash = "sha256-zSam3rUO4WHsPj/oHN5wWBYDCkCeOZcctVd/Z5JxAtI=";
  };

  projectFile = "src/Baballonia.Desktop/Baballonia.Desktop.csproj";
  dotnet-sdk = dotnet.sdk;
  dotnet-runtime = dotnet.runtime;
  nugetDeps = ./deps.json;

  postFixup = ''
    # Move the modules to the correct location where it probes for them.
    mkdir -p $out/lib/baballonia/Modules
    mv $out/lib/baballonia/Baballonia.*Capture.dll $out/lib/baballonia/Modules/
  '';

  runtimeDeps = [
    glib
    gst_all_1.gst-plugins-base
    gst_all_1.gstreamer
    libv4l
    onnxruntime
    udev
  ];

  meta = {
    description = "Cross-platform, hardware-agnostic XR eye and face tracking";
    homepage = "https://github.com/Project-Babble/Baballonia";
    license = lib.licenses.unfree;
    mainProgram = "Baballonia.Desktop";
    maintainers = with lib.maintainers; [ bddvlpr ];
  };
}
