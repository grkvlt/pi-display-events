#!/bin/bash

# get script location
LOCATION=$(dirname $0)

# turn off screen blanking
xset s off
xset -dpms
xset s noblank

# turn off mouse pointer
unclutter -idle "0.1" -root

# start browser in full screen kiosk mode
CHROMIUM_OPTS="--noerrdialogs --disable-infobars --kiosk"
chromium ${CHROMIUM_OPTS} file://${LOCATION}/events.html
#chromium ${CHROMIUM_OPTS} http://cvenues.com/events/aquila.html
