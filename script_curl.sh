#!/bin/bash

response=$(curl --write-out '%{http_code}' --silent --output /dev/null 'http://158.160.61.221:9889')
echo $response
curl -s -X POST https://api.telegram.org/bot7126049267:AAGbxN5AHRzFgXa_ENMC8xdAVjJCQuy2lSI/sendMessage -d chat_id=729788143 -d parse_mode=markdown -d text="*STATUS CODE* : $response"

