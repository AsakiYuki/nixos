#!/usr/bin/env bash

export STATUS_FILE="$XDG_RUNTIME_DIR/touchpad.status"

enable_touchpad() {
    printf "true" >"$STATUS_FILE"
    hyprctl keyword '$LAPTOP_TOUCHPAD_ENABLE' "true" -r
}

disable_touchpad() {
    printf "false" >"$STATUS_FILE"
    hyprctl keyword '$LAPTOP_TOUCHPAD_ENABLE' "false" -r
}

if ! [ -f "$STATUS_FILE" ]; then
  enable_touchpad
else
  if [ $(cat "$STATUS_FILE") = "true" ]; then
    disable_touchpad
  elif [ $(cat "$STATUS_FILE") = "false" ]; then
    enable_touchpad
  fi
fi