#!/bin/sh
#
#	decompose (function)
#
#	For a given input and single character separator, output each field on
#	a seperate line.
#
#	POSIX compliant.
#
#	Example
#
#		$ decompose "$PATH" :
#
decompose()
{
	Input="$1"
	Sep="${2-\n}"
	i=1

	Component="$(echo "$Input" | cut -d"$Sep" -f$i)"

	while test "$Component"
	do
		echo "$Component"
		i=$((i+1))
		Component="$(echo "$Input" | cut -d"$Sep" -f$i)"
	done
}
