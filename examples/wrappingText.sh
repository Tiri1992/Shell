#!/bin/bash

# Wrap text after certain number of characters
text="Thanks again for reading this book! I hope you are following so far"

# Wrap after 16 characters
echo $text | fold -w 16

echo ""
echo Wrapping on break of text only..
echo ""
# If you want to only break lines on spaced characters we can use the -s option as well
echo $text | fold -s -w 16
