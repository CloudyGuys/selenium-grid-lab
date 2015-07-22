#!/bin/bash

function start {
   Xvfb :99 >> /tmp/Xvfb.log 2>&1 &
}

function status {
 pids=$(pidof /usr/bin/Xvfb)
  if [ -z "$pids" ]; then
    /usr/bin/echo "Xvfb is not running"
    exit 1;
  else
    /usr/bin/echo "Xvfb is running under $pids"
    exit 0
  fi
}

case "$1" in
  start)
  start
  ;;        
  status)
  status 
  ;;
  *)
  echo $"Usage: $0 {start|status}"
  exit 1
esac
