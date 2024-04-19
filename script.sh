#!/bin/bash

ls -la ${WORKSPACE} 
localFile = "$(md5sum "${WORKSPACE}/11HW-03/index.html" | cut -d ' ' -f 1)"
echo "--------"
echo ${localFile}
