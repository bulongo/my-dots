#!/usr/bin/env bash

STATE_FILE="/tmp/waybar-cliamp-offset"
DIRECTION_FILE="/tmp/waybar-cliamp-direction"
TRACK_FILE="/tmp/waybar-cliamp-track"

VISIBLE_LENGTH=24

status=$(cliamp status 2>/dev/null)

state=$(awk -F': ' '/^State:/ {print $2}' <<< "$status")
artist=$(awk -F': ' '/^Artist:/ {print $2}' <<< "$status")
track=$(awk -F': ' '/^Track:/ {print $2}' <<< "$status")

if [[ "$state" != "playing" ]]; then
    echo "♫  $artist"
    exit 0
fi

[[ -z "$artist" ]] && artist="Unknown Artist"
[[ -z "$track" ]] && track="Unknown Track"

# Reset when the track changes
last_track=$(cat "$TRACK_FILE" 2>/dev/null || true)

if [[ "$last_track" != "$track" ]]; then
    echo "$track" > "$TRACK_FILE"
    echo 0 > "$STATE_FILE"
    echo 1 > "$DIRECTION_FILE"
fi

offset=$(cat "$STATE_FILE" 2>/dev/null || echo 0)
direction=$(cat "$DIRECTION_FILE" 2>/dev/null || echo 1)

length=${#track}

# Short track — don't scroll
if (( length <= VISIBLE_LENGTH )); then
    display="$track"
else
    display="${track:offset:VISIBLE_LENGTH}"

    # Move forward/backward
    offset=$((offset + direction))

    # Hit the right edge
    if (( offset + VISIBLE_LENGTH >= length )); then
        offset=$((length - VISIBLE_LENGTH))
        direction=-1
    fi

    # Hit the left edge
    if (( offset <= 0 )); then
        offset=0
        direction=1
    fi

    echo "$offset" > "$STATE_FILE"
    echo "$direction" > "$DIRECTION_FILE"
fi

printf '♫  %s  •  %s\n' "$artist" "$display"
