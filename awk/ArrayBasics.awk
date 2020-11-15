#!/usr/bin/awk -f 

# Setting up an array. Arrays in awk are associative, i.e. indicies can be either str or numeric.
BEGIN {
	# Indicies as integers
	myArray[1] = "one";
	myArray[2] = "Two";
	# Indicies as strings
	myArray["name"] = "Michael";

  # Print values
	print myArray[1];
	print myArray[2];
	print myArray["name"];
}
