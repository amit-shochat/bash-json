#!/bin/bash

create_json() {
    TYPE="json"
    NAME=$(whoami)
    HOSTNAME=$HOSTNAME
    MESSAGE="I-am-bash-parser-json-to-logstash"
    cat <<EOF >info.json
{"app":"json","from":"$HOSTNAME","user":"$USER","message":"$MESSAGE","OS":"$(uname -r)","creator":"amit"}
EOF
}

for (( NUM=0; NUM<="$RUN_TIME"; NUM+=5 )); do
	create_json
	for WORD in `cat info.json`
	do
	    echo $WORD
	    # send the JSON payload
	    echo $WORD | nc -v -w 1 $IP $PORT
	done
	sleep 5
done	
