#!/bin/bash

if [[ "$1" -eq "1" ]]; then

        if [[ -f fixme.log ]]; then
                rm fixme.log
                for file in *
                do
                        line=$( tail -n 1 "$file" )
                                if [[ $line = *"#FIXME"* ]]; then
                                        echo -e "$file\n" >> fixme.log
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
                                fi
                done
        fi

elif [[ "$1" -eq "2" ]]; then
        git checkout $(git log --oneline --grep="merge" | tr '[:upper:]' '[:lower:]' | head -n1 | awk '{print $1;}')

elif [[ "$1" -eq "3" ]]; then
        echo "Enter extension"
        read extension
        echo $(find * -type f -name "*$extension"| wc -l)
elif [[ "$1" -eq "4" ]]; then
        if [[ ! -f permissions.log ]]; then
                touch permissions.log
        fi
        read -p "Enter your choice, Change or Restore: " choice
        if [[ $choice = "Change" ]]; then
                rm permissions.log
                touch permissions.log
                for file in $(find * -type f -name "*.sh")
                do
                        echo $(stat -c "%a %n" "$file") >> permissions.log
                        if [[ $(ls -l "$file" | awk '{print $1}') = ??w??????? ]]; then
                                chmod u+x "$file"
                        fi
                        if [[ $(ls -l "$file" | awk '{print $1}') = ?????w???? ]]; then                                                                                                                                                            chmod g+x "$file"
                        fi
                        if [[ $(ls -l "$file" | awk '{print $1}') = ????????w? ]]; then
                                chmod o+x "$file"
                        fi
                done
        elif [[ $choice = "Restore" ]]; then
                while IFS= read -r line
                do
                        splitting="$line"
                        octa=$(echo "$splitting" | awk '{print $1}')
                        file=$(echo "$splitting" | awk '{print $2}')
                        chmod $octa $file
                done < permissions.log
        fi
elif [[ "$1" -eq "5" ]]; then
        read -p "Enter your choice, Backup or Restore: " choice
        if [[ $choice = "Backup" ]]; then
                if [[ ! -d backup ]]; then
                        mkdir backup
                elif [[ -d backup ]]; then
                        rm -r backup
                        mkdir backup
                fi
                touch restore.log                                                                                                                                                                                                  mv restore.log backup
                for file in $(find * -type f -name "*.tmp")
                do
                        echo -ne "$file" >> /home/shakeelt/private/CS1XA3/Project01/backup/restore.log
                        echo -ne " " >> /home/shakeelt/private/CS1XA3/Project01/backup/restore.log
                        location=$(pwd)
                        echo "$location" >> /home/shakeelt/private/CS1XA3/Project01/backup/restore.log
                        cp "$file" /home/shakeelt/private/CS1XA3/Project01/backup
                        rm "$file"
                done
        elif [[ $choice = "Restore" ]]; then
                cd backup
                while IFS= read -r line
                do
                        splitting="$line"
                        name=$(echo "$splitting" | awk '{print $1}')
                        location=$(echo "$splitting" | awk '{print $2}')
                        if [[ -f /home/shakeelt/private/CS1XA3/Project01/backup/"$name" ]]; then
                                mv "$name" "$location"
                        elif [[ ! -f /home/shakeelt/private/CS1XA3/Project01/backup/"$name" ]]; then
                                echo ""$name" does not exit"
                        fi
                done < /home/shakeelt/private/CS1XA3/Project01/backup/restore.log
        fi
elif [[ "$1" -eq "6" ]]; then
        read -p "Enter your choice, New or Delete: " choice
        if [[ "$choice" = "New" ]]; then
                while read -p "Enter 'quit' or enter name for new branch: " && [[ $REPLY != "quit" ]]
                do
                        if [[ $REPLY = "master" ]] || [[ $REPLY = "project01" ]]; then
                                echo "Not allowed"
                        elif [[ $REPLY != "master" ]] || [[ $REPLY != "project01" ]]; then
                                name=$REPLY
                                git checkout -b "$name"
                                break
                        fi
                done
        elif [[ "$choice" = "Delete" ]]; then
                while read -p "Enter 'quit' or enter name to delete branch: " && [[ $REPLY != "quit" ]]
                do
			if [[ $REPLY = "master" ]] || [[ $REPLY = "project01" ]]; then
                                echo "Not allowed"
                        elif [[ $REPLY != "master" ]] || [[ $REPLY != "project01" ]]; then
                                name=$REPLY
				git branch -d "$name"
				break
                        fi
                done
                echo Delete
        fi
elif [[ "$1" -eq "7" ]]; then
	read -p "Enter the branch name to copy from and delete: " first
	read -p "Enter the branch name to copy to: " second
	if [[ "$first" = "master" ]] || [[ "$first" = "project01" ]]; then
		echo "Not allowed"
	elif [[ "$first" != "master" ]] || [[ "$first" != "project01" ]]; then
		git checkout "$second"
		git merge "$first"
		git branch -d "$first"
	fi
fi
