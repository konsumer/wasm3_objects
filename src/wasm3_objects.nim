import wasm3
import wasm3/wasm3c

type
  WasmVector2 {.packed.} = object
    x: int32
    y: int32

proc export_trace(runtime: PRuntime; ctx: PImportContext; sp: ptr uint64; mem: pointer): pointer {.cdecl.} =
  var sp = sp.stackPtrToUint()
  proc procImpl(text: cstring) =
    echo text
  callHost(procImpl, sp, mem)

proc export_dimensions(runtime: PRuntime; ctx: PImportContext; sp: ptr uint64; mem: pointer): pointer {.cdecl.} =
  var sp = sp.stackPtrToUint()
  proc procImpl(retPointer: uint32) =
    let v = WasmVector2(x: int32(5), y: int32(5))

  callHost(procImpl, sp, mem)

var env = m3_NewEnvironment()
var runtime = env.m3_NewRuntime(uint32 uint16.high, nil)
var module: PModule
let wasmBytes = readFile("./test.wasm")
checkWasmRes m3_ParseModule(env, module.addr, cast[ptr uint8](unsafeAddr wasmBytes[0]), uint32 len(wasmBytes))
checkWasmRes m3_LoadModule(runtime, module)

try:
  checkWasmRes m3_LinkRawFunction(module, "*", "trace", "v(*)", export_trace)
except WasmError as e:
  echo "import trace: ", e.msg

try:
  checkWasmRes m3_LinkRawFunction(module, "*", "dimensions", "(i)", export_dimensions)
except WasmError as e:
  echo "import dimensions: ", e.msg

var export_load: PFunction

try:
  checkWasmRes m3_FindFunction(export_load.addr, runtime, "load")
except WasmError as e:
  echo "export load: ", e.msg

if export_load != nil:
  export_load.call(void)
else:
  echo "No load()!"
