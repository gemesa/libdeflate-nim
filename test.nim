import libdeflate

var data_input: array[0..100, uint8]
for x in data_input.mitems:
  x = 10

echo("Input data: ", data_input)
echo("Input data length: ", data_input.len)

let compression_level: cint = 6
var compressor = libdeflate_alloc_compressor(compression_level)
var bound = libdeflate_gzip_compress_bound(compressor, cast[csize_t](data_input.len))
echo("Bound: ", bound)
echo ""

var data_compressed = newSeq[uint8](bound)

echo("Compressing data...")
var compressed_size = libdeflate_gzip_compress(compressor, addr(data_input[0]), cast[csize_t](data_input.len), addr(data_compressed[0]), bound);
data_compressed.setLen(compressed_size)
echo("Compressed data: ", data_compressed)
echo("Compressed data length: ", compressed_size)
echo ""

libdeflate_free_compressor(compressor)

var decompressor = libdeflate_alloc_decompressor()
var data_decompressed: array[0..100, uint8]
var size_decompressed: csize_t = 0
echo("Decompressing data...")
var result = libdeflate_gzip_decompress(decompressor, addr(data_compressed[0]), compressed_size, addr(data_decompressed[0]), cast[csize_t](data_input.len), addr(size_decompressed))
echo("Result: ", result)
echo("Decompressed data: ", data_decompressed)
echo("Decompressed data length: ", size_decompressed)

libdeflate_free_decompressor(decompressor)
