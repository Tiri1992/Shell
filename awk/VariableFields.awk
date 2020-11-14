#!/usr/bin/awk -f

# Count the number of records with 4 fields
# Compute the average of the fourth field
BEGIN {
	FS=" ";
	# Declare variables
	fourthFieldCount = 0;
	fourthFieldSum = 0;
}
{
	# NF = Number of fields
	if (NF == 4) {
		fourthFieldCount += 1;
		fourthFieldSum += $4;
	}
}
END {
	# Print the count and average (where the fourth column exists)
	printf("%8s %3d\n", "COUNT", fourthFieldCount);
	printf("%8s %3d\n", "AVERAGE", fourthFieldSum/fourthFieldCount);
}
