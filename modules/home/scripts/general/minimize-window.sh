#!/usr/bin/env bash

STATE_FILE="/tmp/.minimized_exists"

if [[ -f "$STATE_FILE" ]]; then
	read minimized_exists < "$STATE_FILE"
else
	minimized_exists=""
fi

if [[ -z "$minimized_exists" ]]; then
	hyprctl dispatch movetoworkspace special:minimized
	hyprctl keyword animations:enabled 0
	hyprctl dispatch togglespecialworkspace minimized
	hyprctl keyword animations:enabled 1

	echo "yes" > "$STATE_FILE"
else
	hyprctl dispatch togglespecialworkspace minimized
	hyprctl keyword animations:enabled 0
	hyprctl dispatch movetoworkspace +0
	hyprctl keyword animations:enabled 1

	rm -f "$STATE_FILE"
fi
