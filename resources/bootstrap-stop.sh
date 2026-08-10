#!/bin/bash

# Kill the supervisor first so it cannot respawn the application killed below.
if [[ -f "/.supervisor-pid" ]]; then
    echo "killing supervisor with PID: `cat /.supervisor-pid`"
    kill -9 `cat /.supervisor-pid` 2>/dev/null
    rm /.supervisor-pid
fi

if [[ -f "/.node-pid" ]]; then
    echo "killing expressjs application with PID: `cat /.node-pid`"
    kill -9 `cat /.node-pid` 2>/dev/null
    rm /.node-pid
fi
