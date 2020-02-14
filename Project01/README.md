# CS 1XA3 Project01 - shakeelt

## Usage

   Execute this script from project root with:
      chmod +x project_analyze.sh
      ./project_analyze.sh arg1

   With possible arguments
      arg1: 1
      arg1: 2
      arg1: 3

   Conditions:
      1. arg1: 1
         * If there are no files with '#FIXME' somewhere in the last line of file then the fixme.log
           file will be empty
      2. arg1: 2
         * If there is no commit message with 'merge' (case insensitive) in it then nothing will 
           happen
      3. arg1: 3
         * If a file extension which is non-existant in the directory is entered, the output will be 0

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

## Custom feature 01

   Description: Prompts user if they want to delete a branch or make a new one, if they want to make 
                a new one, check if that branch name exists, if it does then ask user for another 
                name, switch to new branch after making it. If delete is entered, then check if the 
                branch exits, if it does exist then delete that branch else ask user to enter a 
                different name because that branch does not exist and keep asking until a valid 
                branch is entered or 'quit' is entered. Will not delete the master branch.

   Exection: 

   Reference: 

## Custom feature 02

   Description: Copies all the files and folders from another branch and puts it in another branch 
                selected by the user and deletes the branch being copied from.

   Execution: 

   Reference: 
