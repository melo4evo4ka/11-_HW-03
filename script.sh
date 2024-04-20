#!/bin/bash
CHAT_ID = 729788143
TOKEN = '7126049267:AAGbxN5AHRzFgXa_ENMC8xdAVjJCQuy2lSI' 
#ls -la ${WORKSPACE} 
localFile = "$(md5sum "${WORKSPACE}/index.html" | cut -d ' ' -f 1)"
echo "--------"
#echo ${localFile}
file = "$(curl -sL http://158.160.61.221:9889 | md5sum | cut -d ' ' -f 1)"

echo localFile
echo file

if [ localFile == file ]; then
#	echo "success"
curl -s -X POST https://api.telegram.org/bot$(TOKEN)/sendMessage -d chat_id=$(CHAT_ID) -d parse_mode=markdown -d text='*ОК* : MD5 GOOD'
else
#	echo "Failed md5"
curl -s -X POST https://api.telegram.org/bot7126049267:AAGbxN5AHRzFgXa_ENMC8xdAVjJCQuy2lSI/sendMessage -d chat_id=729788143 -d parse_mode=markdown -d text='*BAD* : MD5 BAD'
fi

