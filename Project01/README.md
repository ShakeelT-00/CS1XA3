# CS 1XA3 Project01 - shakeelt

## Usage

   Execute this script from project root with:
      chmod +x project_analyze.sh
      ./project_analyze.sh arg1

   With possible arguments
      arg1: 1
      arg1: 2
      arg1: 3
      arg1: 4
      arg1: 5
      arg1: 6
      arg1: 7

   Conditions:
      1. arg1: 1
         * If there are no files with '#FIXME' somewhere in the last line of file then the fixme.log
           file will be empty
      2. arg1: 2
         * If there is no commit message with 'merge' (case insensitive) in it then nothing will 
           happen
      3. arg1: 3
         * If a file extension which is non-existant in the directory is entered, the output will be 0
      4. arg1: 4
	 * User must enter 'Change' or 'Restore' exactly or else it will not work
      5. arg1: 5
	 * User must enter 'Backup' or 'Restore' exactly or else it will not work
         * If there is no commit message with 'merge' (case insensitive) in it then nothing will
           happen
      6. arg1: 6
	 * User must enter 'New' or 'Delete' exactly or else it will not work
	 * If a branch does not exist to be deleted then it gives error and closes
	 * Branch name cannot be 'master' or 'project01'
      7. arg1: 7
	 * Branch name cannot be 'master' or 'project01'
	 * If a branch does not exist then it gives error and closes

## Feature 01

   Description: This feature searches each file for #FIXME at end of file and puts those file names in
                fixme.log, where each file name is seperated by a new line.

   Execution: ./project_analyze.sh 1

   Reference: Some code was taken from 
              * [[https://stackoverflow.com/questions/5138123/looping-through-all-files-in-a-given-directory]]
              * [[https://stackoverflow.com/questions/42987486/how-to-read-the-last-line-of-a-text-file-into-a-variable-using-bash]]
              * [[https://linuxize.com/post/how-to-check-if-string-contains-substring-in-bash/]]
              * [[https://superuser.com/questions/154936/echo-text-with-new-line-in-bash]]

## Feature 02

   Description: Finds the most recent commit with the word merge in the commit message
                (the word merge is case insensitive) and it checksout the commit
                (putting user in detached head state).

   Execution: ./project_analyze.sh 2

   Reference: Some code was taken from
              * [[https://stackoverflow.com/questions/7124914/how-to-search-a-git-repository-by-commit-message]]
              * [[https://unix.stackexchange.com/questions/65932/how-to-get-the-first-word-of-a-string]]
              * [[https://stackoverflow.com/questions/2264428/how-to-convert-a-string-to-lower-case-in-bash]]

## Feature 03

   Description: Prompts user for a file extension and returns the number of files with that extension 
		in current directory.

   Execution: ./project_analyze.sh 3

   Reference: Some code was taken from 
              * [[https://askubuntu.com/questions/333710/how-to-find-all-files-with-the-same-extension-within-a-directory]]

## Feature 04

   Description: Finds all shell scripts in directory. Creates a file called 'permissions.log' if it
                doesn't already exist. Asks user to input 'Change' or 'Restore'.
                Change: changes the shell script file permissions so only people with write permission
                        will have executable permission. Stores the file name with it's original
                        permissions in file 'permissions.log', overwrites if it already exists.
                Restore: All files in file 'permissions.log' are restored to their original 
			 permissions before they were changed previously.
   Execution: ./project_analyze.sh 4

   Reference: Some code was taken from
              * [[https://askubuntu.com/questions/152001/how-can-i-get-octal-file-permissions-from-command-line]]
              * [[https://unix.stackexchange.com/questions/174037/extracting-the-second-word-from-a-string-variable]]
              * [[https://linuxhint.com/bash_wildcard_tutorial/]]

## Feature 05

   Description: Asks user to enter 'Backup' or 'Restore'.
                Backup: Creates an empty directory 'backup' if it doesn't exist, empties the directory
                        if it does exist. Creates a file 'restore.log' in directory 'backup'. Finds
                        all files that end with '.tmp', stores the file name and original file
                        location in 'restore.log', then copies them to 'backup' and removes them from
                        original location.
                Restore: Restores all the files in the 'restore.log' file to their original location.
                         If the file does not exist then it gives an error.

   Execution: ./project_analyze.sh 5

   Reference: Some code was taken from
	      * [[https://stackoverflow.com/questions/12628327/how-to-show-and-update-echo-on-same-line]]

## Custom feature 01

   Description: Prompts user if they want to delete a branch or make a new one, if they want to make
                a new one, check if that branch name exists, if it does then ask user for another
                name, switch to new branch after making it. If delete is entered, then check if the
                branch exits, if it does exist then delete that branch else ask user to enter a
                different name because that branch does not exist and keep asking until a valid
                branch is entered or 'quit' is entered. Will not delete the master branch.

   Exection: ./project_analyze.sh 6

   Reference: Some code was taken from
	      * [[https://unix.stackexchange.com/questions/228148/how-to-use-user-input-as-a-while-loop-condition]]

## Custom feature 02

   Description: Copies all the files and folders from another branch and puts it in another branch
                selected by the user and deletes the branch being copied from.

   Execution: ./project_analyze.sh 7
