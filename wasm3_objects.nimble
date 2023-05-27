# Package

version       = "0.0.0"
author        = "David Konsumer"
description   = "Tester for return objects from wasm3 host"
license       = "MIT"
srcDir        = "src"
bin           = @["wasm3_objects"]


# Dependencies

requires "nim >= 1.6.12"
requires "https://github.com/beef331/wasm3 >= 0.1.10"

task wasm, "Build wasm tester":
  selfExec("c ./wasm/test.nim")