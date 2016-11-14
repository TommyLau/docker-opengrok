#!/bin/bash

sysctl -w fs.inotify.max_user_watches=8192000

# Start tomcat service
service tomcat7 start

# first-time index
echo "[OpenGrok] First time index"
cd /opengrok/bin/
./OpenGrok index

echo "[OpenGrok] Waiting for updates . . ."
touch $GROK_HOME/reindex

if [ $INOTIFY_NOT_RECURSIVE ]; then
	INOTIFY_CMDLINE="inotifywait -m -e CLOSE_WRITE $GROK_HOME/reindex"
else
	INOTIFY_CMDLINE="inotifywait -mr -e CLOSE_WRITE $GROK_HOME/src"
fi

$INOTIFY_CMDLINE | while read f; do
	printf "[OpenGrok] %s\n" "$f"
	echo "[OpenGrok] Updating index . . ."
	./OpenGrok index
done
