#!/bin/bash

# Script to delete rows from a mysql database by selecting the number of months to keep.

###############################
##  Functions
###############################

function check(){
  if [ $? == 0 ]; then
    echo -e $quit
  else
    echo -e $error
  fi  
}

###############################
## Variables
###############################

db="databasename"
user="username"
password="yourpassword"
action="DELETE"
table="tablename"
field="fieldname"
months="numberofmonthstokeep"
day=$(date --date="-$months month" +%Y-%m-%d" "%H:%M:%S )
quit="\nThe script has finished correctly.\nThe rows deleted are from before $day.\n"
error="\nERROR - We are sorry, your script failed.\n"

###############################
## Program
###############################

mysql $db -u$user -p$password<<<"$action FROM $table WHERE $field < '$day'"

check
