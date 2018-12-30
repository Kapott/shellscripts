#!/bin/bash

# Note: If you don't want to change all the users who use bash, and just want to
# update passwords for certain users, just use the 'chpasswd < inputfile.txt' method
# where inputfile.txt is a textfile with the following format:
# username1:newpassword1
# username2:newpassword2
# ..etc

# find all the usernames with bash logins
usernames=$(cat /etc/passwd  | grep bash | sed 's/:.*//g)

# mass change all bash users' passwords to randomly generated passwords
# and output a list of new username/password combinations
for user in $usernames; do 
	newpass=$(tr -cd '[:alnum:]' < /dev/urandom | fold -w30 | head -n1)
	echo "$user:${newpass}" | chpasswd
	printf "List of new passwords:\n"
	printf "%s \t %s\n" "$user" "$newpass"
done
