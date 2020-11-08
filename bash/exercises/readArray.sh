#!/bin/bash

# Read an input of countries and output the names with a space between them on one line
# Question: https://www.hackerrank.com/challenges/bash-tutorials-read-in-an-array/problem

# Delcare an array
declare -a countries

# Make sure to pipe this script with the input data
# i.e. cat ../../data/countries.txt | ./readArray.sh 

i=0
# Declare array to populate
declare -a countries
while read line
	do
		countries[i]=$line
		# Increment: create another bash shell within the shell
		((i+=1))
	done

# Echo out all elements in array with [@]
echo ${countries[@]}
