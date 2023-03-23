#
#	enumerate (function)
#
#	Echo an initializer string for an associative array,
#	each key being assigned a different integer value.
#
#	@params $@ sequence of identifiers for enumerated constants
#
#	Example
#		$ enumerate a 'b c' d	# outputs: [a]=0 [b c]=1 [d]=2
#
#	Usage
#		$ declare -A MyEnum="($(enumerate Elem1 Elem2 Elem3))"
#
#	Note
#		As seen in 'Usage', use either quotes or escape the parenthese of
#		the array declaration.
#
enumerate()
{
	local OutputString
	local -i i=0

	for EnumId in "$@"
	do
		OutputString+="[$EnumId]=$((i++)) "
	done

	printf '%s' "${OutputString::-1}"
}
