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
decArr=(John Daniel James)

echo ${decArr[@]}

