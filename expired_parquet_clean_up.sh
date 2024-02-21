#!/bin/bash

if [ "$#" -ne 2 ]; then
	echo "This script will scan the given path for parquet files older than the given days and remove them"
	echo "Usage: $0 <path> <days>"
	echo "Example: $0 /tmp/nanomq-parquet/ 15"
	exit 1
fi

echo scan $1 for parquet files older than $2 days
find $1 -name "*.parquet" -type f -mtime +$2 -exec ls -al {} \;
echo "cleaning up parquet files older than $2 days"
find $1 -name "*.parquet" -type f -mtime +$2 -exec rm -fv {} \;
echo "done"
