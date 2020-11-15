#!/usr/bin/awk -f

# Use the associative nature of arrays in awk as a word counter
BEGIN {
	# Delim comma
	FS = ",";
	# Output delim also comma
	OFS = ",";
}
{
	# Inc for every count of the word occurance
	freq[$1]++;
}
END {
	# Print the word and its count
	for (x in freq) {
		print x, freq[x];
	}
}
