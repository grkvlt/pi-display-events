#!/bin/bash

# install configuration variables
TARGET_DIR="${1:-/events}"
TARGET_USER="${2:-pi}"

# copy install script
mkdir -p ${TARGET_DIR}
install -m 755 events.sh ${TARGET_DIR}
install -m 644 events.html ${TARGET_DIR}

( apt-get update
  apt-get install unclutter
)

# add event displayer to autostart
AUTOSTART="/home/${TARGET_USER}/.config/lxsession/LXDE-pi/autostart"
mkdir -p $(dirname ${AUTOSTART})
cat <<EOF >> ${AUTOSTART}
@${TARGET_DIR}/events.sh
EOF
chown ${TARGET_USER} ${AUTOSTART}

