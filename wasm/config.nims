--os:linux
--cpu:wasm32
--cc:gcc
--listCmd
--mm:orc
--exceptions:goto
--define:noSignalHandler
--noMain:on
--threads:off
--define:release

--gcc.exe:emcc
--gcc.linkerexe:emcc
--gcc.cpp.exe:emcc
--gcc.cpp.linkerexe:emcc

switch("passL", "--no-entry -sSTANDALONE_WASM=1 -sERROR_ON_UNDEFINED_SYMBOLS=0")
switch("passL", "-o " & projectName() & ".wasm")