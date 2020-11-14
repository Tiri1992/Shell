#!/usr/bin/awk -f
BEGIN { 
	# Specify character set of delimiters
	FS="[:-]";
}
{
	# Print the first column (Names)
	print $1
}
