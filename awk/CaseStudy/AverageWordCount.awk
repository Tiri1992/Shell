#!/usr/bin/awk -f

# We compute the average word count. Word count is the last field so we can use $NF (number of fields)
BEGIN {
	FS = ",";
	# Declare counter
	count = 0;
}
{
	# Ignore First row:
	if (NR == 1) {
		# Skips row
		next;
	}
	# $NF will print last field, which is word count
	count += $NF;
}
END {
	printf("%8s %5d\n", "AVG WC", count / NR);
}
