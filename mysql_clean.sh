#!/bin/bash

# Script to delete rows from a mysql database by selecting the number of months to keep.

db="databasename"
user="username"
password="yourpassword"
action="DELETE"
table="tablename"
field="fieldname"
months="numberofmonthstokeep"
day=$(date --date="-$months month" +%Y-%m-%d" "%H:%M:%S )
quit="\nThe script has finished correctly.\nThe rows deleted are from before $day.\n"

mysql $db -u$user -p$password<<<"$action FROM $table WHERE $field < '$day'"

echo -e $quit
