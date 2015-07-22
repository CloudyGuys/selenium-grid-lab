#!/bin/bash

SELENIUM_BASE_DIR=$2
SELENIUM_JAR_NAME=$3

SELENIUM_JAR=$SELENIUM_BASE_DIR/$SELENIUM_JAR_NAME
HUB_HOME=$SELENIUM_BASE_DIR/hub



function start {
  java -jar $SELENIUM_JAR -role hub -hubConfig $HUB_HOME/hub.json >> $HUB_HOME/logs/hub.log 2>&1 &
}

function status {

PID=$(/usr/bin/ps -ef | /usr/bin/grep -v grep | /usr/bin/grep selenium | /usr/bin/awk '{print $2}' )

  if [ -z "$PID" ];
  then
	/usr/bin/echo "Selenium not running"
    exit 1;
  else
	/usr/bin/echo "Selenium is running under $PID"
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
