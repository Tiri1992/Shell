#!/usr/bin/awk -f

# Check to see if there are values in the array:
# We may need to check before we leap with an IF statement
BEGIN {
	myArray[1] = "Alex";
	myArray[3] = "Michael";
	myArray[4] = "Jess";
	myArray[5] = "Michelle";
	myArray[7] = "Tom";

# Loop over the integers 1-7 and check if values are indexes in myArray
for (i = 1; i <= 7; i++){
	if (i in myArray) {
		printf("Array at index %1d has value %s\n", i, myArray[i]);
	}
  else {
    # Let user know this index does not exist
    printf("Array does not contain index %1d\n", i);
  }
}
}
