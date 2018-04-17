#!/bin/bash

BASE_PATH="/Users/mykhailo.koretskyi/IdeaProjects/cgi"
HTTPD_PATH="/usr/local/apache2"

trap "{ echo 'Exiting'; }" EXIT SIGTERM

docker run \
    -it \
    -p 8080:80 \
    -v $BASE_PATH/conf:$HTTPD_PATH/conf \
    -v $BASE_PATH/cgi-bin:$HTTPD_PATH/cgi-bin \
    -v $BASE_PATH/lib:$HTTPD_PATH/lib \
    httpd:2.4
