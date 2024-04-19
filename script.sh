#!/bin/bash

#ls -la ${WORKSPACE} 
localFile = "$(md5sum "${WORKSPACE}/index.html" | cut -d ' ' -f 1)"
echo "--------"
#echo ${localFile}
file = "$(curl -sL http://158.160.61.221:9889 | md5sum | cut -d ' ' -f 1)"

echo $localFile
echo $file

if [ localFile == file ]; then
	echo "success"
else
	echo "Failed md5"
fi

