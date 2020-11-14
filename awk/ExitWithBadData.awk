#!/usr/bin/awk -f

# This program will exit if it finds less than 4 fields in a input line
{
	if (NF < 4) {
		print "Exiting program...";
		exit
	}
	print $0;
}
