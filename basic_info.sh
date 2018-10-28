#!/bin/bash


html=1 #If -p is not triggered then creat HTML code.
plain=0
help=0

while getopts "ph" opt; do
  case $opt in
        p) html=0; plain=1;;
        h) html=0; help=1;;
  esac
done



DATE=$(date)
UPTIME=$(uptime --pretty)
LOGGED_IN_USERS=$(who)
FREE_RAM=$(free --byte)
#FREE_RAM=$(cat /proc/meminfo | grep "Mem")
FREE_DISK=$(df -h)

if [ $html = 1 ]; then
cat << _EOF_

<HTML>
	<HEAD>
		<TITLE> Basic system information </TITLE>
	</HEAD>
	<BODY>
		<P>Date: $DATE</P>
		<P>Uptime: $UPTIME</P>
		<p> <b>Logged in users: $LOGGED_IN_USERS</b> </p>
		<p> <i>Free ram: <PRE>$FREE_RAM</PRE> </i> </p>
		<p> <strong>Free disk: <PRE><del>$FREE_DISK</del></PRE></strong> </p>
	</BODY>

</HTML>
_EOF_
elif [ $plain = 1 ]; then
#Print out plain ascii
echo -e "ASCII: \n \n $DATE \n $UPTIME \n $LOGGED_IN_USERS \n $FREE_RAM \n $FREE_DISK"
elif [ $help = 1 ]; then
echo "Use -p to get plain ASCII text printed to terminal
Else you will get HTML formatted output"

fi
