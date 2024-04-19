#!/bin/bash

ls -la ${WORKSPACE} 
localFile = "$(md5sum "${WORKSPACE}/index.html" | cut -d ' ' -f 1)"
echo "--------"
echo ${localFile}
