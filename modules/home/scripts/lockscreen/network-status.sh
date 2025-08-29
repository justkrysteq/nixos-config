#!/usr/bin/env bash

status="$(nmcli -t -f STATE general)"

case "$status" in
	disconnected)
		if [[ -z "$1" || $1 == "icon" ]]; then
			printf "󱂠 "
		fi
		;;
	connecting)
		if [[ -z "$1" || $1 == "icon" ]]; then
			printf "󱞒  "
		fi
		;;
	connected)
		type="$(nmcli -f TYPE connection show --active | grep -Eo 'wifi|ethernet')"

		if [[ "$type" == "wifi" ]]; then
			unformatted_link_quality="$(iwconfig wlo1 | grep 'Link Quality' | cut -d '=' -f 2 | cut -d ' ' -f 1)"

			current_level=${unformatted_link_quality%%/*}
			max_level=${unformatted_link_quality##*/}

			link_quality=$((current_level * 100 / max_level))

			if [[ -z "$1" || $1 == "icon" ]]; then
				if [[ -z "$link_quality" || "$link_quality" -eq 0 ]]; then
					printf "󰤯 "
				elif (( link_quality <= 25 )); then
					printf "󰤟 "
				elif (( link_quality <= 50 )); then
					printf "󰤢 "
				elif (( link_quality <= 75 )); then
					printf "󰤥 "
				elif (( link_quality <= 100 )); then
					printf "󰤨 "
				fi
			elif [[ $1 == "value" ]]; then
				printf $link_quality
			fi
		elif [[ "$type" == "ethernet" ]]; then
			if [[ -z "$1" || $1 == "icon" ]]; then
				printf "󰈀 "
# 			elif [[ $1 == "value" ]]; then
# 				printf ""
			fi
		else
			if [[ -z "$1" || $1 == "icon" ]]; then
				printf "󱂠 "
# 			elif [[ $1 == "value" ]]; then
# 				printf ""
			fi
		fi
		;;
esac
