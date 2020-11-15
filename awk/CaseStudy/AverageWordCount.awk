#!/usr/bin/awk -f

# We compute the average word count. Word count is the last field so we can use $NF (number of fields)
# We look at comparing the avg word count with the rec with a comment vs without
BEGIN {
	FS = ",";
	# Declare counter
	countComment = 0;
	countNoComment = 0;
}
{
	# Ignore First row:
	if (NR == 1) {
		# Skips row
		next;
	}
	if ($5 > 0) {
		# $NF will print last field, which is word count
		countComment += $NF;
		}
	else if ($5 == 0) {
		countNoComment += $NF;
	}
}
END {
	printf("%10s\n", "AVERAGE WC");
	printf("%10s %5d\n", "COMMENT", countComment / NR);
	printf("%10s %5d\n", "NO COMMENT", countNoComment / NR);
}
