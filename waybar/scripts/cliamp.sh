#!/usr/bin/env bash

STATUS=$(cliamp status)

STATE=$(echo "$STATUS" | grep '^State:' | cut -d: -f2- | xargs)
TRACK=$(echo "$STATUS" | grep '^Track:' | cut -d: -f2- | xargs)
ARTIST=$(echo "$STATUS" | grep '^Artist:' | cut -d: -f2- | xargs)

if [[ "$STATE" == "playing" ]]; then
    echo "󰏤  $ARTIST — $TRACK"
elif [[ "$STATE" == "paused" ]]; then
    echo "󰐊  $ARTIST — paused"
else
    echo "󰎈  No music"
fi

