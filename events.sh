#!/bin/bash
#
# PI DISPLAY EVENTS
#
# Raspberry PI code for displaying HTML file listing events on a
# monitor. The events are exported froma Google Sheets document.
#
# Version 0.1.1
#
# Usage:
#   events.sh
#
# Copyright 2022 by Andrew Donald Kennedy
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

# debugging
#set -x

# get HTML location
HTML_DIR="/var/www/html"

# turn off screen blanking
xset s off
xset -dpms
xset s noblank

# turn off mouse pointer
unclutter -idle "0.1" -root &

# start browser in full screen kiosk mode
#CHROMIUM_OPTS="--noerrdialogs --disable-infobars --kiosk"
CHROMIUM_OPTS="--start-fullscreen --force-device-scale-factor=0.7"
chromium-browser ${CHROMIUM_OPTS} file://${HTML_DIR}/events.html
#chromium-browser ${CHROMIUM_OPTS} http://localhost/events.html
#chromium-browser ${CHROMIUM_OPTS} http://cvenues.com/events/aquila.html
