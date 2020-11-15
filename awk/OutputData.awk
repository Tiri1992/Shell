#!/usr/bin/awk -f

# Append rows to an output file
{
	# Awk chooses to append/create option the first time a file is opened
	# if you wish to create the file at runtime switch to '>'
	print $0 >> "dumps/dump.data";
}
