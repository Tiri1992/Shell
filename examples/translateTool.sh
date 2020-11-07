#!/bin/bash

# Starting text
text="Computers are fast"
echo $text

# Sub capital A with lowercase a 
echo $text | tr 'a' 'A'

# Change lower into upper characters
echo $text | tr '[:lower:]' '[:upper:]'

# We can transform character sets of vowels into empty spaces
echo $text | tr '[aeiou]' ' '

# Deleting the matching vowels and returning a new string. Using -d for delete
echo $text | tr -d '[aeiou]'

# Sub a range of characters and numbers
num="5uch l337 5p34k"
echo $num

# Range of numbers 1-4: 1,2,3,4
echo $num | tr '1-4' 'x'

# Range of characters a-e (a,b,c,..,e)
echo $text | tr 'a-e' 'x'
