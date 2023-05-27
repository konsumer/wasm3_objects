# this is the source for the wasm that needs to receive the object

import wasm3/exporter

type
  Vector2* {.byref,packed.} = object
    x*: int32
    y*: int32

# Demo function that should always return (5, 5)
proc dimensions*(): Vector2 {.importc, cdecl.}

# Simple logger, so I don't have to implement WASI in host for echo
proc trace*(text: cstring) {.importc, cdecl.}

# Entrypoint function
proc load() {.wasmexport.} =
  trace("Hello from demo. This should be Vector2(x:5, y:5):")
  trace($dimensions())

