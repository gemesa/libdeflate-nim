# libdeflate-nim
libdeflate-nim is a very thin Nim wrapper for [libdeflate](https://github.com/ebiggers/libdeflate).

## Deployment

### Prerequisites

The following tools are necessary for building:
- `nim` (2.2.0)
- `nimble` (0.16.1) (only if you want to install the package)
- C compiler (`gcc`, `clang`, etc.)

### How to build

Invoke the following command to build the archive library:

```nim
$ nim c -d:release --app:staticlib -o:libdeflate.a libdeflate.nim
```

Invoke the following command to build the shared object:
```nim
$ nim c -d:release --app:lib -o:libdeflate.so libdeflate.nim
```

## Quickstart

*test.nim* contains a very basic code to demonstrate the usage of the libdeflate API. Invoke the following command to build and run it:
```nim
$ nim c -r -d:release test.nim
```
You should see a similar output:

```nim
$ nim c -r -d:release test.nim
Hint: used config file '<your-path>/.choosenim/toolchains/nim-1.6.10/config/nim.cfg' [Conf]
Hint: used config file '<your-path>/.choosenim/toolchains/nim-1.6.10/config/config.nims' [Conf]
..........................................................
CC: adler32
CC: crc32
CC: deflate_compress
CC: deflate_decompress
CC: gzip_compress
CC: gzip_decompress
CC: utils
CC: zlib_compress
CC: zlib_decompress
CC: cpu_features
CC: ../../.choosenim/toolchains/nim-1.6.10/lib/std/private/digitsutils.nim
CC: ../../.choosenim/toolchains/nim-1.6.10/lib/system/assertions.nim
CC: ../../.choosenim/toolchains/nim-1.6.10/lib/system/dollars.nim
CC: ../../.choosenim/toolchains/nim-1.6.10/lib/system/io.nim
CC: ../../.choosenim/toolchains/nim-1.6.10/lib/system.nim
CC: libdeflate.nim
CC: test.nim
Hint:  [Link]
Hint: gc: refc; opt: speed; options: -d:release
26779 lines; 2.385s; 31.57MiB peakmem; proj: <your-path>/libdeflate-nim/test.nim; out: <your-path>/libdeflate-nim/test [SuccessX]
Hint: <your-path>/libdeflate-nim/test  [Exec]
Input data: [10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10]
Input data length: 101
Bound: 133

Compressing data...
Compressed data: @[31, 139, 8, 0, 0, 0, 0, 0, 0, 255, 227, 226, 162, 3, 0, 0, 164, 97, 116, 73, 101, 0, 0, 0]
Compressed data length: 24

Decompressing data...
Result: LIBDEFLATE_SUCCESS
Decompressed data: [10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10]
Decompressed data length: 101
```
