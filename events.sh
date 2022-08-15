#!/bin/bash

# turn off screen blanking
xset s off
xset -dpms
xset s noblank

# turn off mouse pointer
unclutter -idle "0.1" -root

# start browser in full screen kiosk mode
chromium --kiosk file:///events/event-display.html?venue=place
#chromium --kiosk http://cvenues.com/events/event-display.html?venue=place
