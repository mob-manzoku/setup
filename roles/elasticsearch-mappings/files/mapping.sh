#!/bin/sh

if [ "$#" != 1 ]; then
    echo "Select file"
    exit 1
fi

NAME=$1
MAPPINGFILES='/project/apps/elasticsearch/mappings'
JSONFILE="$MAPPINGFILES/$NAME.json"

if [ ! -e "$JSONFILE" ]; then
    echo "No file $JSONFILE"
    exit 1
fi

URL='localhost:9200/_template'
curl -X PUT --data "@$JSONFILE" "$URL/$NAME"
