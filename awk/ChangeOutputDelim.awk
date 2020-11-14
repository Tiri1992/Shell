#!/usr/bin/awk -f

# We can change the output delim into a comma (csv)
BEGIN {
	# Declare many different field sep as an input
	FS="[:-]";
	# One output
	OFS=",";
}
{
	print $1, $2, $3;
}
