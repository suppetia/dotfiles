#!/bin/bash
state=$(gsettings get org.gnome.desktop.peripherals.touchpad send-events)

if [[ "${state}" =~ "enabled" ]] ;then
  gsettings set org.gnome.desktop.peripherals.touchpad send-events disabled
else
  gsettings set org.gnome.desktop.peripherals.touchpad send-events enabled
fi
