#!/bin/bash


localFile = "$(md5sum "${WORKSPACE}/www/index.html" | cut -d ' ' -f 1)"
echo "--------"
echo ${localFile}
