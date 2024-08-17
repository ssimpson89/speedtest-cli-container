#!/bin/bash

# Set terminal type
export TERM=xterm-256color

# Run xsos with all arguments passed to the container
/usr/bin/speedtest --accept-license "$@" 