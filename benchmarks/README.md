## CuPBoP-AMD Benchmarks

### Additional Benchmarks

Read [benchmark boilerplate](./boilerplate) for instructions and sample code for adding new benchmarks.

### Rodinia GPU

| Name | Working | Notes |
| ---- | ------- | ----- |
| B+Tree | :heavy_check_mark: ||
| B+Tree21 | :heavy_check_mark: ||
| backprop | :heavy_check_mark: ||
| bfs | :heavy_check_mark: ||
| cfd | :heavy_check_mark: ||
| dwt2d | :heavy_check_mark: ||
| gaussian | :heavy_check_mark: | Slow comparing to HIPIFY version. Requires further investigation. |
| heartwall | :heavy_check_mark: ||
| hotspot | :heavy_check_mark: ||
| hotspot3D | :heavy_check_mark: ||
| huffman | :x: | [WIP] Compiles with both CuPBoP-AMD and HIPIFY. Both produce mismatched vectors. |
| hybridsort | :heavy_check_mark: | Works until SIZE is greater than around 2700 - 4096 |
| kmeans | :heavy_check_mark: | size *offset = NULL segfaults with HIPAMD but not CUDA |
| lavaMD | :heavy_check_mark: ||
| leukocyte | :heavy_check_mark: | size *offset = NULL segfaults with HIPAMD but not CUDA |
| lud | :heavy_check_mark: ||
| myocyte | :x: | [WIP] Both Invalid Data. |
| nn | :heavy_check_mark: | Nearest Neighbor |
| nw | :heavy_check_mark: ||
| particlefilter-float | :heavy_check_mark: ||
| particlefilter-naive | :heavy_check_mark: ||
| pathfinder | :heavy_check_mark: ||
| srad-v2 | :x: | [WIP] Compiles with both CuPBoP-AMD and HIPIFY. Both segfaults. |
| streamcluster | :heavy_check_mark: ||
