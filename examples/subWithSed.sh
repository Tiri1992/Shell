#!/bin/bash

# Using sed to sub text
cat ../data/duplicated.data

# Sub hello with 'x', first pipe in the data
# This will only change first match on each line with an 'x'
cat ../data/duplicated.data | sed 's/hello/x/'

# To replace ALL occurrences of hello on each line with 'x' use the /g (global)
cat ../data/duplicated.data | sed 's/hello/x/g'

# We can also tell sed which line to make the changes on
# This will make the change on the first line only
cat ../data/duplicated.data | sed '1s/hello/x/g'


