#!/usr/bin/awk -f

# For computation outside of input files, write inside BEGIN 
BEGIN {
	i = 1;
	while (i <= 10) {
			printf("The square of %d is %d\n", i, i ^ 2);
			i += 1;
	}
}
