#!/bin/bash

# Reading in piped data cat sample.data | ./readArraySubValues.sh
# Store as a variable
arr=($(cat))

# Any elements in the array that contain an -i 'a' will be removed
echo ${arr[@]/*[Aa]*/}
