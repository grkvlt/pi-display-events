#!/bin/bash
#
# PI DISPLAY EVENTS INSTALL
#
# Version 0.1.0
#
# Usage:
#   install.sh [ target-directory [ target-user ] ]
#
# Copyright 2022 by Andrew Donald Kennedy
#
# Licensed under the Apache Software License, Version 2.0

# error handler function
function error() {
    echo "Error: $@" >&2
    exit 1
}

# check for root user
[ "${EUID}" -eq 0 ] || error "Please run installer as root"

# install configuration variables
TARGET_DIR="${1:-/events}"
TARGET_USER="${2:-pi}"

# install packages
(   apt-get -qq update
    apt-get -qq --assume-yes install \
            unclutter \
            apache2
) || error "Package installation failed"

# copy install script
mkdir -p ${TARGET_DIR}
install -m 755 events.sh ${TARGET_DIR}
install -m 644 events.html ${TARGET_DIR}

# add event displayer to autostart
AUTOSTART="/home/${TARGET_USER}/.config/lxsession/LXDE-pi/autostart"
mkdir -p $(dirname ${AUTOSTART})
cat <<EOF >> ${AUTOSTART}
@${TARGET_DIR}/events.sh
EOF
chown ${TARGET_USER} ${AUTOSTART}
