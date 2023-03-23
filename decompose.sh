#!/bin/bash
#
#	decompose (function)
#
#	For a given input and single character separator, output each field on
#	a seperate line.
#
#	Requires Bash 4.4 or greater.
#
#	Example
#
#		$ decompose "$PATH" :
#
decompose()
{
	local -r Input="$1"
	local -r Separator="${2-$'\n'}"

	local -a Array=()

	mapfile -d"$Separator" -t Array <<< "$Input"

	# output of the script
	for Component in "${Array[@]}"
	do
		printf '%s\n' "$Component"
	done
}
