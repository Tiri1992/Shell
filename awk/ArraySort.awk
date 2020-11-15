#!/usr/bin/awk -f

# We use an associative array to sort the order of our data
{
	sortArr[$1] = $2
}
END {
	# Print in sorted order
	for (i = 1; i <= NR; i++) {
		print i, sortArr[i];
	}
}
