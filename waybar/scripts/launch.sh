#!/usr/bin/env bash

pkill -x waybar

while pgrep -x waybar >/dev/null; do
    sleep 0.1
done

waybar >/dev/null 2>&1 & disown
