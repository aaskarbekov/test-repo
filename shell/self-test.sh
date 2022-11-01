#!/bin/sh

logger "Script started."
SCRIPT_DIR=`dirname $0`

cd "$SCRIPT_DIR"
logger "Generating random file."
mktemp XXXXXX && logger "Random file generated." || logger -p local3.error "Something went wrong"
find . -maxdepth 1 -type f -not -path ./$0 -mmin +1 -exec rm -f {} \; && \
	logger "Files older than 1 minute has been removed." || \
	logger "Something went wrong again."
