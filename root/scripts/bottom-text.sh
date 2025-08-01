#!/usr/bin/env bash

STATUS=$(playerctl status 2>/dev/null)

if [ "$STATUS" = "Playing" ]; then
    echo "   $(playerctl metadata --format '{{artist}} - {{title}}')"
else
    echo "Welcome back, $(whoami) ;-;"
fi
