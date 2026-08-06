#!/bin/bash

echo "starting expressjs application"
cd /root/puppeteer-api

# Supervisor loop: if the node process dies (it should survive render errors,
# but this is the backstop), restart it within a second instead of leaving a
# dead listener until the Docker healthcheck replaces the whole container.
(
  while true; do
    node index.js &
    echo $! > /.node-pid
    wait $!
    echo "expressjs application died (exit $?), restarting in 1s"
    sleep 1
  done
) &
echo $! > /.supervisor-pid
echo "expressjs supervisor started with PID: `cat /.supervisor-pid`, application PID: `cat /.node-pid 2>/dev/null`"
