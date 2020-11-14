#!/usr/bin/awk -f

# Calculate the average maths (second col) and science (third col)
BEGIN {
	#Input Delimiter = FS
	FS=",";
	printf("%10s %8s %8s\n", "NAME", "MATHS", "SCIENCE");
	# Declare variables
	sumMath=0;
	sumScience=0;
}
{
	printf("%10s %8d %8d\n", $1, $2, $3);
	# Add grades
	sumMath+=$2
	sumScience+=$3
}
END {
	# Check if data exists
	if (NR > 0) {
		printf("%10s %8d %8d\n","AVERAGE", sumMath/NR, sumScience/NR)
		}
}
