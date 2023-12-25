#!/bin/bash

# Build the docker image and update the wt script
docker build -t nicksterling/bashly .

docker run --rm -it -v $(pwd):/data -u 501 -w /data nicksterling/bashly bashly generate -e production