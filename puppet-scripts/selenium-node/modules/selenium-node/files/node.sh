#!/bin/bash

SELENIUM_BASE_DIR=$2
SELENIUM_JAR_NAME=$3
DISPLAY=:99

SELENIUM_JAR=$SELENIUM_BASE_DIR/$SELENIUM_JAR_NAME
NODE_HOME=$SELENIUM_BASE_DIR/node



function start {
  java -jar $SELENIUM_JAR -role node -nodeConfig $NODE_HOME/node.json >> $NODE_HOME/logs/node.log 2>&1 &
}

function status {

  PID=$(ps -ef | grep -v grep | grep selenium | awk '{print $2}' )

  if [ -z "$PID" ];
  then
	/usr/bin/echo "Selenium node not running"
    exit 1;
  else
	/usr/bin/echo "Selenium node is running under $PID"
    exit 0;
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
