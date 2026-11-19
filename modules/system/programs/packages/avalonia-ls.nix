{
  lib,
  buildDotnetModule,
  dotnetCorePackages,
  fetchFromGitHub,
  fontconfig,
  stdenv,
  runCommand,
}:

buildDotnetModule {
  pname = "avalonia-ls";
  version = "0-unstable-2025-02-14";

  src = fetchFromGitHub {
    owner = "SaverinOnRails";
    repo = "ls-for-avalonia";
    rev = "cc8aed50c84b0711472a51af906f63e5c037a529";
    hash = "sha256-rp/RUw593d1zOoSZ2yGe6iKL8CUbX2BfhMhciJ1HEAs=";
    fetchSubmodules = true;
  };

  projectFile = [
    "src/AvaloniaLSP/AvaloniaLanguageServer/AvaloniaLanguageServer.csproj"
    "src/SolutionParser/SolutionParser.csproj"
    "src/XamlStyler/src/XamlStyler.Console/XamlStyler.Console.csproj"
    "src/AvaloniaPreview/AvaloniaPreview.csproj"
  ];

  nugetDeps = ./deps.json;

  dotnet-sdk = with dotnetCorePackages; combinePackages [
    sdk_8_0
    sdk_9_0
    sdk_10_0
  ];
dotnet-runtime =
    let
      combined = with dotnetCorePackages; combinePackages [
        sdk_8_0
        sdk_9_0
        sdk_10_0
      ];
    in
    (runCommand "dotnet-combined-unwrapped" { } ''
      mkdir -p "$out/share/dotnet" "$out/bin"
      cp -aL "${combined}/share/dotnet/." "$out/share/dotnet/"
      cp -aL "${combined}/nix-support" "$out/nix-support"
      ln -s "$out/share/dotnet/dotnet" "$out/bin/dotnet"
    '') // { inherit (combined) passthru; };
  # Needed if AvaloniaPreview/SkiaSharp loads native font/C++ libraries
  runtimeDeps = [
    fontconfig
    stdenv.cc.cc.lib
  ];

  executables = [
    "AvaloniaLanguageServer"
    "SolutionParser"
    "xstyler"
    "AvaloniaPreview"
  ];

  postPatch = ''
    substituteInPlace src/XamlStyler/src/XamlStyler.Console/XamlStyler.Console.csproj \
      --replace-fail '</Project>' '  <PropertyGroup><TargetFrameworks></TargetFrameworks><TargetFramework>net9.0</TargetFramework></PropertyGroup>
    </Project>'
  '';

  postFixup = ''
    mv "$out/bin/AvaloniaLanguageServer" "$out/bin/avalonia-ls"
    mv "$out/bin/SolutionParser" "$out/bin/avalonia-solution-parser"
    mv "$out/bin/xstyler" "$out/bin/xaml-styler"
    mv "$out/bin/AvaloniaPreview" "$out/bin/avalonia-preview"
  '';

  meta = {
    description = "Standalone Language Server for Avalonia XAML files";
    homepage = "https://github.com/SaverinOnRails/ls-for-avalonia";
    license = lib.licenses.mit;
    mainProgram = "avalonia-ls";
    platforms = dotnetCorePackages.sdk_9_0.meta.platforms;
  };
}
