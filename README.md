This is a demo of passing an object as a return-value, from wasm3 host.

```
# build test wasm
nimble wasm

# run example
nimble run
```

If I try to link the raw function like this, I get `import dimensions: function signature mismatch`:

```nim
checkWasmRes m3_LinkRawFunction(module, "*", "dimensions", "*()", export_dimensions)
```

Since `type[0] (i32) -> nil` I also tried like this, andd usedd the arg as the "wasm address of return" which is what is in the currrent repo:

```nim
checkWasmRes m3_LinkRawFunction(module, "*", "dimensions", "v(i)", export_dimensions)
```


Here is the dump of `test.wasm`:

```

test.wasm:  file format wasm 0x1

Section Details:

Type[19]:
 - type[0] (i32) -> nil
 - type[1] (i32) -> i32
 - type[2] (i32, i32) -> nil
 - type[3] () -> nil
 - type[4] (i32, i32, i32) -> i32
 - type[5] (i32, i32) -> i32
 - type[6] () -> i32
 - type[7] (i32, i32, i32) -> nil
 - type[8] (i32, i64, i32) -> i64
 - type[9] (i32, i32, i32, i32) -> i32
 - type[10] (i32, i64) -> nil
 - type[11] (i32, i32, i32, i32, i32, i32) -> i32
 - type[12] (i32, i64, i32, i32) -> i32
 - type[13] (i32, i32, i32, i32, i32) -> i32
 - type[14] (i64, i64, i64) -> nil
 - type[15] (i32, i32, i32, i32) -> nil
 - type[16] (i32, i32, i32, i32, i32) -> nil
 - type[17] (i32, i32, i32, i32, i32, i32, i32) -> i32
 - type[18] (i32, i32, i32, i32, i32, i64) -> i32
Import[5]:
 - func[0] sig=0 <env.dimensions> <- env.dimensions
 - func[1] sig=0 <wasi_snapshot_preview1.proc_exit> <- wasi_snapshot_preview1.proc_exit
 - func[2] sig=1 <wasi_snapshot_preview1.fd_close> <- wasi_snapshot_preview1.fd_close
 - func[3] sig=9 <wasi_snapshot_preview1.fd_write> <- wasi_snapshot_preview1.fd_write
 - func[4] sig=12 <wasi_snapshot_preview1.fd_seek> <- wasi_snapshot_preview1.fd_seek
Function[94]:
 - func[5] sig=3
 - func[6] sig=0
 - func[7] sig=10
 - func[8] sig=10
 - func[9] sig=2
 - func[10] sig=10
 - func[11] sig=2
 - func[12] sig=3
 - func[13] sig=5
 - func[14] sig=13
 - func[15] sig=14
 - func[16] sig=0
 - func[17] sig=3
 - func[18] sig=0
 - func[19] sig=7
 - func[20] sig=5
 - func[21] sig=4
 - func[22] sig=7
 - func[23] sig=5
 - func[24] sig=0
 - func[25] sig=2
 - func[26] sig=2
 - func[27] sig=7
 - func[28] sig=7
 - func[29] sig=7
 - func[30] sig=15
 - func[31] sig=7
 - func[32] sig=2
 - func[33] sig=3
 - func[34] sig=7
 - func[35] sig=0
 - func[36] sig=4
 - func[37] sig=5
 - func[38] sig=4
 - func[39] sig=5
 - func[40] sig=9
 - func[41] sig=16
 - func[42] sig=2
 - func[43] sig=2
 - func[44] sig=2
 - func[45] sig=0
 - func[46] sig=2
 - func[47] sig=3 <load>
 - func[48] sig=3 <_initialize>
 - func[49] sig=4
 - func[50] sig=4
 - func[51] sig=3
 - func[52] sig=3
 - func[53] sig=0
 - func[54] sig=0
 - func[55] sig=1
 - func[56] sig=0
 - func[57] sig=1
 - func[58] sig=3
 - func[59] sig=0
 - func[60] sig=1
 - func[61] sig=4
 - func[62] sig=9
 - func[63] sig=6 <__errno_location>
 - func[64] sig=6
 - func[65] sig=17
 - func[66] sig=11
 - func[67] sig=1
 - func[68] sig=0
 - func[69] sig=0
 - func[70] sig=5
 - func[71] sig=5
 - func[72] sig=11
 - func[73] sig=3
 - func[74] sig=18
 - func[75] sig=5
 - func[76] sig=6
 - func[77] sig=3
 - func[78] sig=1
 - func[79] sig=1
 - func[80] sig=4
 - func[81] sig=8
 - func[82] sig=8
 - func[83] sig=1
 - func[84] sig=1
 - func[85] sig=1
 - func[86] sig=1
 - func[87] sig=0
 - func[88] sig=5
 - func[89] sig=5
 - func[90] sig=2
 - func[91] sig=3 <emscripten_stack_init>
 - func[92] sig=6 <emscripten_stack_get_free>
 - func[93] sig=6 <emscripten_stack_get_base>
 - func[94] sig=6 <emscripten_stack_get_end>
 - func[95] sig=6 <stackSave>
 - func[96] sig=0 <stackRestore>
 - func[97] sig=1 <stackAlloc>
 - func[98] sig=6 <emscripten_stack_get_current>
Table[1]:
 - table[0] type=funcref initial=5 max=5
Memory[1]:
 - memory[0] pages: initial=256 max=256
Global[3]:
 - global[0] i32 mutable=1 - init i32=65536
 - global[1] i32 mutable=1 - init i32=0
 - global[2] i32 mutable=1 - init i32=0
Export[13]:
 - memory[0] -> "memory"
 - table[0] -> "__indirect_function_table"
 - func[47] <load> -> "load"
 - func[48] <_initialize> -> "_initialize"
 - func[63] <__errno_location> -> "__errno_location"
 - func[91] <emscripten_stack_init> -> "emscripten_stack_init"
 - func[92] <emscripten_stack_get_free> -> "emscripten_stack_get_free"
 - func[93] <emscripten_stack_get_base> -> "emscripten_stack_get_base"
 - func[94] <emscripten_stack_get_end> -> "emscripten_stack_get_end"
 - func[95] <stackSave> -> "stackSave"
 - func[96] <stackRestore> -> "stackRestore"
 - func[97] <stackAlloc> -> "stackAlloc"
 - func[98] <emscripten_stack_get_current> -> "emscripten_stack_get_current"
Elem[1]:
 - segment[0] flags=0 table=0 count=4 - init i32=1
  - elem[1] = func[5]
  - elem[2] = func[79]
  - elem[3] = func[80]
  - elem[4] = func[82]
Code[94]:
 - func[5] size=4
 - func[6] size=3
 - func[7] size=523
 - func[8] size=170
 - func[9] size=16
 - func[10] size=15
 - func[11] size=488
 - func[12] size=475
 - func[13] size=488
 - func[14] size=810
 - func[15] size=1253
 - func[16] size=555
 - func[17] size=38
 - func[18] size=20
 - func[19] size=309
 - func[20] size=527
 - func[21] size=259
 - func[22] size=373
 - func[23] size=648
 - func[24] size=192
 - func[25] size=427
 - func[26] size=1974
 - func[27] size=461
 - func[28] size=255
 - func[29] size=257
 - func[30] size=250
 - func[31] size=387
 - func[32] size=666
 - func[33] size=481
 - func[34] size=201
 - func[35] size=37
 - func[36] size=236
 - func[37] size=219
 - func[38] size=121
 - func[39] size=212
 - func[40] size=238
 - func[41] size=267
 - func[42] size=579
 - func[43] size=122
 - func[44] size=692
 - func[45] size=188
 - func[46] size=9
 - func[47] size=97 <load>
 - func[48] size=12 <_initialize>
 - func[49] size=491
 - func[50] size=370
 - func[51] size=2
 - func[52] size=43
 - func[53] size=13
 - func[54] size=7
 - func[55] size=4
 - func[56] size=2
 - func[57] size=308
 - func[58] size=60
 - func[59] size=97
 - func[60] size=92
 - func[61] size=204
 - func[62] size=87
 - func[63] size=6 <__errno_location>
 - func[64] size=7
 - func[65] size=4
 - func[66] size=4
 - func[67] size=4
 - func[68] size=2
 - func[69] size=2
 - func[70] size=210
 - func[71] size=64
 - func[72] size=217
 - func[73] size=2
 - func[74] size=119
 - func[75] size=12
 - func[76] size=12
 - func[77] size=8
 - func[78] size=4
 - func[79] size=11
 - func[80] size=355
 - func[81] size=55
 - func[82] size=13
 - func[83] size=29
 - func[84] size=21
 - func[85] size=82
 - func[86] size=5543
 - func[87] size=1627
 - func[88] size=23
 - func[89] size=417
 - func[90] size=1557
 - func[91] size=18 <emscripten_stack_init>
 - func[92] size=7 <emscripten_stack_get_free>
 - func[93] size=4 <emscripten_stack_get_base>
 - func[94] size=4 <emscripten_stack_get_end>
 - func[95] size=4 <stackSave>
 - func[96] size=6 <stackRestore>
 - func[97] size=18 <stackAlloc>
 - func[98] size=4 <emscripten_stack_get_current>
Data[2]:
 - segment[0] memory=0 size=768 - init i32=65536
  - 0010000: 3030 3031 3032 3033 3034 3035 3036 3037  0001020304050607
  - 0010010: 3038 3039 3130 3131 3132 3133 3134 3135  0809101112131415
  - 0010020: 3136 3137 3138 3139 3230 3231 3232 3233  1617181920212223
  - 0010030: 3234 3235 3236 3237 3238 3239 3330 3331  2425262728293031
  - 0010040: 3332 3333 3334 3335 3336 3337 3338 3339  3233343536373839
  - 0010050: 3430 3431 3432 3433 3434 3435 3436 3437  4041424344454647
  - 0010060: 3438 3439 3530 3531 3532 3533 3534 3535  4849505152535455
  - 0010070: 3536 3537 3538 3539 3630 3631 3632 3633  5657585960616263
  - 0010080: 3634 3635 3636 3637 3638 3639 3730 3731  6465666768697071
  - 0010090: 3732 3733 3734 3735 3736 3737 3738 3739  7273747576777879
  - 00100a0: 3830 3831 3832 3833 3834 3835 3836 3837  8081828384858687
  - 00100b0: 3838 3839 3930 3931 3932 3933 3934 3935  8889909192939495
  - 00100c0: 3936 3937 3938 3939 0100 0000 d000 0100  96979899........
  - 00100d0: 0100 0040 2800 0000 0200 0040 2c20 0000  ...@(......@, ..
  - 00100e0: 0200 0040 3a20 0000 0000 0000 0000 0000  ...@: ..........
  - 00100f0: ff00 0101 0202 0202 0303 0303 0303 0303  ................
  - 0010100: 0404 0404 0404 0404 0404 0404 0404 0404  ................
  - 0010110: 0505 0505 0505 0505 0505 0505 0505 0505  ................
  - 0010120: 0505 0505 0505 0505 0505 0505 0505 0505  ................
  - 0010130: 0606 0606 0606 0606 0606 0606 0606 0606  ................
  - 0010140: 0606 0606 0606 0606 0606 0606 0606 0606  ................
  - 0010150: 0606 0606 0606 0606 0606 0606 0606 0606  ................
  - 0010160: 0606 0606 0606 0606 0606 0606 0606 0606  ................
  - 0010170: 0707 0707 0707 0707 0707 0707 0707 0707  ................
  - 0010180: 0707 0707 0707 0707 0707 0707 0707 0707  ................
  - 0010190: 0707 0707 0707 0707 0707 0707 0707 0707  ................
  - 00101a0: 0707 0707 0707 0707 0707 0707 0707 0707  ................
  - 00101b0: 0707 0707 0707 0707 0707 0707 0707 0707  ................
  - 00101c0: 0707 0707 0707 0707 0707 0707 0707 0707  ................
  - 00101d0: 0707 0707 0707 0707 0707 0707 0707 0707  ................
  - 00101e0: 0707 0707 0707 0707 0707 0707 0707 0707  ................
  - 00101f0: 496e 6465 7844 6566 6563 7400 4f76 6572  IndexDefect.Over
  - 0010200: 666c 6f77 4465 6665 6374 0052 616e 6765  flowDefect.Range
  - 0010210: 4465 6665 6374 0066 6174 616c 2e6e 696d  Defect.fatal.nim
  - 0010220: 0073 7973 4661 7461 6c00 4865 6c6c 6f20  .sysFatal.Hello 
  - 0010230: 6672 6f6d 2064 656d 6f2e 2054 6869 7320  from demo. This 
  - 0010240: 7368 6f75 6c64 2062 6520 5665 6374 6f72  should be Vector
  - 0010250: 3228 783a 352c 2079 3a35 293a 006f 7574  2(x:5, y:5):.out
  - 0010260: 206f 6620 6d65 6d6f 7279 0a00 2b00 0040   of memory..+..@
  - 0010270: 696e 6465 7820 6f75 7420 6f66 2062 6f75  index out of bou
  - 0010280: 6e64 732c 2074 6865 2063 6f6e 7461 696e  nds, the contain
  - 0010290: 6572 2069 7320 656d 7074 7900 0600 0040  er is empty....@
  - 00102a0: 696e 6465 7820 0000 0d00 0040 206e 6f74  index .....@ not
  - 00102b0: 2069 6e20 3020 2e2e 2000 0000 1400 0040   in 0 .. ......@
  - 00102c0: 7661 6c75 6520 6f75 7420 6f66 2072 616e  value out of ran
  - 00102d0: 6765 3a20 0000 0000 0400 0040 202e 2e20  ge: .......@ .. 
  - 00102e0: 0000 0000 1200 0040 6f76 6572 2d20 6f72  .......@over- or
  - 00102f0: 2075 6e64 6572 666c 6f77 0000 0803 0100   underflow......
 - segment[1] memory=0 size=160 - init i32=66304
  - 0010300: 8000 0000 0000 0000 0500 0000 0000 0000  ................
  - 0010310: 0000 0000 0200 0000 0000 0000 0000 0000  ................
  - 0010320: 0000 0000 0000 0000 0000 0000 0300 0000  ................
  - 0010330: 0400 0000 b419 0100 0000 0000 0000 0000  ................
  - 0010340: 0000 0000 0200 0000 0000 0000 0000 0000  ................
  - 0010350: 0000 0000 ffff ffff ffff ffff 0000 0000  ................
  - 0010360: 0000 0000 0000 0000 0000 0000 0000 0000  ................
  - 0010370: 0000 0000 0000 0000 0000 0000 0000 0000  ................
  - 0010380: 0000 0000 0000 0000 0000 0000 0000 0000  ................
  - 0010390: 0000 0000 0000 0000 0803 0100 b01b 0100  ................

```