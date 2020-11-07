#!/bin/bash

# Takes the columns and transposes into rows using -s stream input
# Here we take two columns in separate files and make them into rows

paste -s -d, ../data/ingrediants.data ../data/prices.data
