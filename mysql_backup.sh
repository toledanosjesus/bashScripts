#!/bin/bash

# Script to backup all mysql databases

###############################
##  Functions
###############################

function check(){
  if [ ${PIPESTATUS[0]} == 0 ]; then
    echo -e $quit
  else
    echo -e $error
  fi  
}

###############################
## Variables
###############################

user="username"
password="userpassword"
dir="backupdir"
day=$(date +%Y-%m-%d)
file="backupname-$day.sql.gz"
backup=$dir$file
quit="\nThe script has finished correctly.\n"
error="\nERROR - We are sorry, your script failed.\n"

###############################
## Program
###############################

mysqldump --all-databases  --events --user=$user --password=$password | gzip -c >$backup
check
