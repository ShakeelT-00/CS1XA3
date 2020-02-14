#!/bin/bash

if [[ "$1" -eq "1" ]]; then

	if [[ -f fixme.log ]]; then
		rm fixme.log
		for file in *
		do
			line=$( tail -n 1 "$file" )
				if [[ $line = *"#FIXME"* ]]; then
					echo -e "$file\n" >> fixme.log
					echo yes
				fi
		done
	fi

	if [[ ! -f fixme.log ]]; then
		touch fixme.log
		for file1 in *
		do
			line=$( tail -n 1 "$file1")
				if [[ $line = *"#FIXME"* ]]; then
					echo -e "$file1\n" >> fixme.log
					echo yes
				fi
		done
	fi

elif [[ "$1" -eq "2" ]]; then
	git checkout $(git log --oneline --grep="merge" | tr '[:upper:]' '[:lower:]' | head -n1 | awk '{print $1;}')

elif [[ "$1" -eq "3" ]]; then
	echo "Enter extension"
	read extension
	echo $(find * -type f -name "*$extension"| wc -l)
fi
