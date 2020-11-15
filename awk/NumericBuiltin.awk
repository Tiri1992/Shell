#!/usr/bin/awk -f

# Explore the numeric built in functions available in awk
# Apply the sqrt(), int(), exp() and rand() random number functions to the grades.csv
BEGIN {
	FS = ",";
}
{
	printf("%8s Sqrt: %3d Int Sqrt: %3d, Exp: %3d, Random Number -> %3d\n", $1, sqrt($2), int(sqrt($2)), exp($2),rand() * 100);
}
