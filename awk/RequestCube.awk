#!/usr/bin/awk -f

# Requests a number and cubes it
BEGIN {
	print "Type in a number...";
}
{
	printf("The cube of %d is %d\n", $1, $1 ^3);
}
END {
	print "Done"
}
