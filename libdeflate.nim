{. passC: "-Ilibdeflate -Ilibdeflate/lib" .}
{. passC: "-O2 -DNDEBUG" .}
{. passC: "-Wall -Wdeclaration-after-statement -Wimplicit-fallthrough -Wmissing-field-initializers -Wmissing-prototypes -Wpedantic -Wshadow -Wstrict-prototypes -Wundef -Wvla" .}

{. compile: "libdeflate/lib/adler32.c" .}
{. compile: "libdeflate/lib/crc32.c" .}
{. compile: "libdeflate/lib/deflate_compress.c" .}
{. compile: "libdeflate/lib/deflate_decompress.c" .}
{. compile: "libdeflate/lib/gzip_compress.c" .}
{. compile: "libdeflate/lib/gzip_decompress.c" .}
{. compile: "libdeflate/lib/utils.c" .}
{. compile: "libdeflate/lib/zlib_compress.c" .}
{. compile: "libdeflate/lib/zlib_decompress.c" .}
when defined(arm) or defined(arm64):
  {. passC: "-Ilibdeflate/lib/arm" .}
  {. compile: "libdeflate/lib/arm/cpu_features.c" .}
else:
  {. passC: "-Ilibdeflate/lib/x86" .}
  {. compile: "libdeflate/lib/x86/cpu_features.c" .}

const
  LIBDEFLATE_VERSION_MAJOR* = 1
  LIBDEFLATE_VERSION_MINOR* = 15
  LIBDEFLATE_VERSION_STRING* = "1.15"

type
  libdeflate_result* = enum
    LIBDEFLATE_SUCCESS = 0,
    LIBDEFLATE_BAD_DATA = 1,
    LIBDEFLATE_SHORT_OUTPUT = 2,
    LIBDEFLATE_INSUFFICIENT_SPACE = 3

proc libdeflate_alloc_compressor*(compression_level: cint): pointer {. importc: "libdeflate_alloc_compressor" .}

proc libdeflate_deflate_compress*(compressor: pointer;
                                 `in`: pointer; in_nbytes: csize_t; `out`: pointer;
                                 out_nbytes_avail: csize_t): csize_t {. importc: "libdeflate_deflate_compress" .}

proc libdeflate_deflate_compress_bound*(compressor: pointer;
                                       in_nbytes: csize_t): csize_t {. importc: "libdeflate_deflate_compress_bound" .}

proc libdeflate_zlib_compress*(compressor: pointer; `in`: pointer;
                              in_nbytes: csize_t; `out`: pointer;
                              out_nbytes_avail: csize_t): csize_t {. importc: "libdeflate_zlib_compress" .}

proc libdeflate_zlib_compress_bound*(compressor: pointer;
                                    in_nbytes: csize_t): csize_t {. importc: "libdeflate_zlib_compress_bound" .}

proc libdeflate_gzip_compress*(compressor: pointer; `in`: pointer;
                              in_nbytes: csize_t; `out`: pointer;
                              out_nbytes_avail: csize_t): csize_t {. importc: "libdeflate_gzip_compress" .}

proc libdeflate_gzip_compress_bound*(compressor: pointer;
                                    in_nbytes: csize_t): csize_t {. importc: "libdeflate_gzip_compress_bound" .}

proc libdeflate_free_compressor*(compressor: pointer) {. importc: "libdeflate_free_compressor" .}

proc libdeflate_alloc_decompressor*(): pointer {. importc: "libdeflate_alloc_decompressor" .}

proc libdeflate_deflate_decompress*(decompressor: pointer;
                                   `in`: pointer; in_nbytes: csize_t;
                                   `out`: pointer; out_nbytes_avail: csize_t;
                                   actual_out_nbytes_ret: ptr csize_t): libdeflate_result {. importc: "libdeflate_deflate_decompress" .}

proc libdeflate_deflate_decompress_ex*(decompressor: pointer;
                                      `in`: pointer; in_nbytes: csize_t;
                                      `out`: pointer; out_nbytes_avail: csize_t;
                                      actual_in_nbytes_ret: ptr csize_t;
                                      actual_out_nbytes_ret: ptr csize_t): libdeflate_result {. importc: "libdeflate_deflate_decompress_ex" .}

proc libdeflate_zlib_decompress*(decompressor: pointer;
                                `in`: pointer; in_nbytes: csize_t; `out`: pointer;
                                out_nbytes_avail: csize_t;
                                actual_out_nbytes_ret: ptr csize_t): libdeflate_result {. importc: "libdeflate_zlib_decompress" .}

proc libdeflate_zlib_decompress_ex*(decompressor: pointer;
                                   `in`: pointer; in_nbytes: csize_t;
                                   `out`: pointer; out_nbytes_avail: csize_t;
                                   actual_in_nbytes_ret: ptr csize_t;
                                   actual_out_nbytes_ret: ptr csize_t): libdeflate_result {. importc: "libdeflate_zlib_decompress_ex" .}

proc libdeflate_gzip_decompress*(decompressor: pointer;
                                `in`: pointer; in_nbytes: csize_t; `out`: pointer;
                                out_nbytes_avail: csize_t;
                                actual_out_nbytes_ret: ptr csize_t): libdeflate_result {. importc: "libdeflate_gzip_decompress" .}

proc libdeflate_gzip_decompress_ex*(decompressor: pointer;
                                   `in`: pointer; in_nbytes: csize_t;
                                   `out`: pointer; out_nbytes_avail: csize_t;
                                   actual_in_nbytes_ret: ptr csize_t;
                                   actual_out_nbytes_ret: ptr csize_t): libdeflate_result {. importc: "libdeflate_gzip_decompress_ex" .}

proc libdeflate_free_decompressor*(decompressor: pointer) {. importc: "libdeflate_free_decompressor" .}

proc libdeflate_adler32*(adler: uint32; buffer: pointer; len: csize_t): uint32 {. importc: "libdeflate_adler32" .}

proc libdeflate_crc32*(crc: uint32; buffer: pointer; len: csize_t): uint32 {. importc: "libdeflate_crc32" .}

proc libdeflate_set_memory_allocator*(malloc_func: proc (a1: csize_t): pointer;
                                     free_func: proc (a1: pointer)) {. importc: "libdeflate_set_memory_allocator" .}
