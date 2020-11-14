#!/usr/bin/awk -f

# We can change the delimiter depending on the input record
{
	if ($1 == "#START") {
		# Changes the delimiter to :
		FS=":";
	}
	else if ($1 == "#STOP") {
		# Changes the delimiter to " "
			FS=" ";
	} 
	else {
		# Print the Roman number in column 3
		print $3
	}
}
