#!/bin/bash

# Basic examples setting up an array in bash

# Declaring an array: created automatically when a variable is used like this
myarr[0]='Sotiri'
myarr[1]='Melios'
myarr[2]='Chris'

# Print all values in an array
echo ${myarr[@]}

# Arrays can be declared first using -a command
declare -a decArr

# and elements added in a ()
decArr=(John Daniel James Anna)

echo ${decArr[@]}

# Number of characters in the first index of the array
echo ${#decArr[1]}

# Following example searches for James and replaced with Sotiri
echo ${decArr[@]/James/Sotiri}

# Slice an array starting at index 1 and select 2 elements (index 1,2)
echo ${decArr[@]:1:2}

# First 3 characters of the element at index 1
echo ${decArr[1]:0:3}

# Print new array
echo ${decArr[@]}

# Setup new array with countries
countriesArr=('England' 'Germany' 'France' 'Italy')

echo ${countriesArr[@]}

# Add an element to countriesArr
countriesArr=("${countriesArr[@]}" "Spain" "Greece")

echo ${countriesArr[@]}


