#!/bin/bash

declare -a countryArr

# read in values and store in array
while read country;

do 
	countryArr+=($country)
done

# Print array index 3 to 7
echo ${countryArr[@]3:5}

# To run file: cat ../../data/countries.txt | ./sliceArr.sh
