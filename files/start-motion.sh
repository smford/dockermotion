#!/bin/sh

trap catchtrap HUP INT QUIT TERM

catchtrap() {
	echo "Trap has been caught, shutting down"
  exit 1
}

service motion start
echo "exited $0"
