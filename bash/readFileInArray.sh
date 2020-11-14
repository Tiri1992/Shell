#!/bin/bash

# Read sample.data into program via 
filecontent=(`cat "sample.data"`)

# Print all content
echo ${filecontent[@]}

echo "Line by line.."

# Read out line by line with for loop
for country in ${filecontent[@]};
do
	# echo country out
	echo $country
done
