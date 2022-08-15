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
chromium --kiosk file://${LOCATION}/events.html
#chromium --kiosk http://cvenues.com/events/events.html?venue=place
