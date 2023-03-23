#!/bin/sh
#
#	basefilename (function)
#
#	Given a file path, return only the file name, stripped of its extension.
#
basefilename()
{
	filename="$(basename "$1")"
	prefix=

	if [[ ${filename::1} == . ]]; then
		prefix=.
		filename="${filename:1}"
	fi

	echo -n "$prefix"
	echo "$filename" | rev | cut -f 2- -d '.' | rev
}
