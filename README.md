docker build -t xpress-dev .
docker run  -v ${PWD}:/data xpress-dev /bin/sh -c 'cmake -S /data -B /build && cd build && make && ./xdecompress
