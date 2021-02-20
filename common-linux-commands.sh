#!/usr/bin/env bash

usage() {
  echo "List of common linux commands I usually utilize

Here the the list.

  File Commands:

  -ls -a	              List all the content, including hidden files
  -ls -l	              List the content and its information
  -pwd                  Output the current directory that you are in
  -cd -	                Return to the previous directory
  -cd	                  Return to the $Home directory
  -pushd                Change directory and store into the stack
  -popd                 Return directory from the top of the stack
  -rm -f file1	        Remove file1 without prompt
  -rm -r folder	        Remove a folder and its content recursively
  -file file1	          Show the file type of file1
  -cat > file1	        Concatenate standard input to file1
  -cat file1 file2	    Concatenate file1 to file 2c
  -less file1	          View and paginate file1
  -head file1	          Show first 10 lines of file1
  -tail file1	          Show last 10 lines of file1
  -touch	              Create a new blank file
  -diff	                Compare difference among 2 files
  -wget	                Download a particular file
  -curl	                Retrieve information of a source with given URL

  System Commands:

  -df -h	              Show disk space of OS with option h(readable for human)
  -du -sh	              Show disk space with option h(readable for human) and option s(summarize disk info)
  -date	                Show system date
  -uptime	              Show system uptime
  -whoami	              Show your username
  -!!	                  Repeat the last command

  File Searching Commands:

  -grep pattern files	  Search for pattern in files
  -grep -i	            Case insensitive search
  -grep -r	            Recursive search
  -grep -v	            Inverted search
  -grep -o	            Show matched part of file only
  -locate file1	        Find file1
  -which app            Locate a command for the app

  Process Management:

  -ps	                  Show snapshot of processes
  -top	                Show real time processes
  -history              History of list used commands
  -apropos              Help to find other command line
  -free	                Show memory and swap usage
  -kill	                Kill process with given PID (Process ID)
"
}
