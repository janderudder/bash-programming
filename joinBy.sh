#
# joinBy (function)
#
# Join any group of elements by a string separator.
# By Nicholas Sushkin https://stackoverflow.com/a/17841619/5890806
#
function joinBy
{
	local d=${1-} f=${2-}
	if shift 2; then
		printf %s "$f" "${@/#/$d}"
	fi
}
