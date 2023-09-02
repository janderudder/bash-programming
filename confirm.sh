#!/bin/bash

##
## confirm
##
## Display a prompt and ask for yes/no confirmation.
##
## * Aguments
##
## @positional prompt message to display
## @switch --strict | -s accept only yes and no as valid answer, otherwise
## 		anything besides yes is a no (including empty answer)
## @switch --localized | -l tries to display yes/no choice in the language of
## 		the user
## @return 0 if answer is yes, 1 otherwise.
##
## * Notes
## - test the localization with `$ LC_MESSAGES=yourlocale.UTF-8 confirm`
## - heavily inspired from code from stackoverflow
##
confirm()
{
	local message=
	local strictMode=0
	local localized=0

	while [[ $# -ne 0 ]]; do
		arg="$1"
		case "$arg" in
			--strict | -s )
				strictMode=1
			;;
			--localized | -l )
				localized=1
			;;
			--)
				shift
				message="$@"
				break;;
			*)
				message="$arg"
		esac
		shift
	done

	read -rd '' yesexpr noexpr yesstr nostr rest < <(locale LC_MESSAGES)

	# default values for yes/no variables
	yesexpr="${yesexpr:-^[+1yY]}"
	noexpr="${noexpr:-^[-0nN]}"
	yesstr="${yesstr:-yes}"
	nostr="${nostr:-no}"

	local y="${yesstr:0:1}"
	local n="${nostr:0:1}"

	read -rp "$message ($y/$n) " answer

	if [[ $strictMode -eq 1 ]]
	then
		while [[ ! $answer =~ $yesexpr ]] && [[ ! $answer =~ $noexpr ]]
		do
			echo "Please answer with either $yesstr or $nostr."
			read -rp "$message ($y/$n) " answer
		done
	fi

	[[ $answer =~ $yesexpr ]]
	return $?
}
