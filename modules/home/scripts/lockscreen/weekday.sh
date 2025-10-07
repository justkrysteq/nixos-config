#!/usr/bin/env bash

weekday="$(date +'%a')"

if [[ $weekday == "pon" ]]; then
	printf "MONDAY"
elif [[ $weekday == "wto" ]]; then
	printf "TUESDAY"
elif [[ $weekday == "śro" ]]; then
	printf "WEDNESDAY"
elif [[ $weekday == "czw" ]]; then
	printf "THURSDAY"
elif [[ $weekday == "pią" ]]; then
	printf "FRIDAY"
elif [[ $weekday == "sob" ]]; then
	printf "SATURDAY"
elif [[ $weekday == "nie" ]]; then
	printf "SUNDAY"
fi
