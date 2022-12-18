##
## Echo an initializer string for an associative array.
##
## Example:
##		`enumerate a b c` echoes ([a]=0 [b]=1 [c]=2)
##
## Usage:
## 		declare -A MyEnum=$(enumerate Elem1 Elem2 Elem3)
##
## @params sequence of identifiers for enumerated constants
##
enumerate()
{
	local ArrayString
	local -i i=0

	for EnumId in $@
	do
		ArrayString+="[$EnumId]=$((i++)) "
	done

	echo -n "(${ArrayString})"
}
