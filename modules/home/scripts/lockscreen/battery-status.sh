#!/usr/bin/env bash

status="$(cat /sys/class/power_supply/BAT1/status)"
level="$(cat /sys/class/power_supply/BAT1/capacity)"

if [[ "$status" == "Discharging" ]]; then
	if (( level == 0 )); then
		printf "󰂎 "
	elif (( level <= 10 )); then
		printf "󰁺 "
	elif (( level <= 20 )); then
		printf "󰁻 "
	elif (( level <= 30 )); then
		printf "󰁼 "
	elif (( level <= 40 )); then
		printf "󰁽 "
	elif (( level <= 50 )); then
		printf "󰁾 "
	elif (( level <= 60 )); then
		printf "󰁿 "
	elif (( level <= 70 )); then
		printf "󰂀 "
	elif (( level <= 80 )); then
		printf "󰂁 "
	elif (( level <= 90 )); then
		printf "󰂂 "
	elif (( level <= 100 )); then
		printf "󰁹 "
	else
		printf "󰂃 "
	fi
elif [[ "$status" == "Charging" ]]; then
	if (( level == 0 )); then
		printf "󰢟 "
	elif (( level <= 10 )); then
		printf "󰢜 "
	elif (( level <= 20 )); then
		printf "󰂆 "
	elif (( level <= 30 )); then
		printf "󰂇 "
	elif (( level <= 40 )); then
		printf "󰂈 "
	elif (( level <= 50 )); then
		printf "󰢝 "
	elif (( level <= 60 )); then
		printf "󰂉 "
	elif (( level <= 70 )); then
		printf "󰢞 "
	elif (( level <= 80 )); then
		printf "󰂊 "
	elif (( level <= 90 )); then
		printf "󰂋 "
	elif (( level <= 100 )); then
		printf "󰂅 "
	else
		printf "󱃍 "
	fi
elif [[ "$status" == "Full" ]]; then
	printf "󰁹 "
else
	printf "󰂑 "
fi
