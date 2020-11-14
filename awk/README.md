# AWK - Tutorial

We look at some of the basic structure of the awk programming language.

Ref: https://www.grymoire.com/Unix/Awk.html#uh-0

## Basic Structure

pattern { action }

Awk is line oriented, each line is read as an input. If the condition is true then the action is taken.

`BEGIN` is run before any input is read and `END` is executed after all input has been read.

```awk
BEGIN { print "START" }
		{ print $0 }
END { print "STOP" }
```

## AutoIncrement/Autodecrement Operators

```awk
BEGIN {x=4
	print x++
} # incremenet x=5

BEGIN {x=6
	print x--
} #decrement x=5
```

Increasing using assignment operators
```sh
x=x+2; # adds 2
x+=2; # also adds 2
x-=2; # Removes 2
x*=2; # multiplies 2
x/=3; # divide variable result by 3
x%=4; # Apply modulo 4 to variable
```


## Coniditonal Expressions

Operator:: MEANING
```sh
== # is equal
!= # is not equal
> # is greater than
>= # is greater than or equal
< # less than
<= # less than or equal
&& # AND
|| # OR
! # NOT
```

## Regular expressions

Operator:: MEANING
```sh
~ # matches
!~ # Does not match
```
#
### Examples

Compute all the squares of the numbers 1 to 10 using a while loop.
Notice we only use the code inside BEGIN statement.

`#CalculationWhile.awk`
```awk
#!/usr/bin/awk -f

# For computation outside of input files, write inside BEGIN 
BEGIN {
	i = 1;
	while (i <= 10) {
			printf("The square of %d is %d\n", i, i ^ 2);
			i += 1;
	}
}
```
Output:
```sh
The square of 1 is 1
The square of 2 is 4
The square of 3 is 9
The square of 4 is 16
The square of 5 is 25
The square of 6 is 36
The square of 7 is 49
The square of 8 is 64
The square of 9 is 81
The square of 10 is 100
```

Same thing but using a for loop is more concise.

`#CalculationFor.awk`

```awk
#!/usr/bin/awk -f

# Using a FOR loop to construct the squares of the numbers 1 to 10
BEGIN {
		for (i = 1; i <= 10; i++) {
				# Format the numbers using printf
				printf("The square of %d is %d\n", i, i ^ 2);
		}
}

```

Request a cube of a number.

```awk
#!/usr/bin/awk -f

# Requests a number and cubes it
BEGIN {
	print "Type in a number...";
}
{
	printf("The cube of %d is %d\n", $1, $1 ^3);
}
END {
	print "Done"
}
```
Ouput

```sh
Type in a number...
3
The cube of 3 is 27
4
The cube of 4 is 64
5
```

Average grades in maths and science. Data found `data/grades.csv`

`#AverageGrades.awk`

```awk
BEGIN {
	#Input Delimiter = FS
	FS=",";
	printf("%10s %8s %8s\n", "NAME", "MATHS", "SCIENCE");
	# Declare variables
	sumMath=0;
	sumScience=0;
}
{
	printf("%10s %8d %8d\n", $1, $2, $3);
	# Add grades
	sumMath+=$2
	sumScience+=$3
}
END {
	# Check if data exists
	if (NR > 0) {
		printf("%10s %8d %8d\n","AVERAGE", sumMath/NR, sumScience/NR)
		}
}
```

Output: 

```sh
      NAME    MATHS  SCIENCE
   Michael       80       47
      John       49       23
      Anna       59       89
    Hannah       41       49
      Mark       32       67
      Jane       79       50
      Emma       34       62
     Harry       74       88
   Miranda       49       73
   AVERAGE       55       60
```

Changing the delimiter for each line input as we read in. Suppose we have the following dataset with different delimiters.

`#data/badDelimiters.csv`

```sh
ONE 1 I
TWO 2 II
#START
THREE:3:III
FOUR:4:IV
FIVE:5:V
#STOP
SIX 6 VI
SEVEN 7 VII
```

We want to change the delimiter every time we reach either `#STAR` or `#STOP`.

`#VariableDelimiter.awk`

```awk
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
```
Output the third field:

```sh
I
II
III
IV
V
VI
VII
```

Dealing with multiple delimiters, we can specify a character set inside the `FS` argument.

Heres an example of some data with different delimiters.

`#data/changeDelimiters.data`

```sh
James:50:39
Alex:96:58
Harry-33-52
Anna-59-63
Emma:93:23
Chris:43:75
```

To get the names (first column) of each input line.

`#HardDelimiter.awk`

```awk
#!/usr/bin/awk -f
BEGIN { 
	# Specify character set of delimiters
	FS="[:-]";
}
{
	# Print the first column (Names)
	print $1
}
```

Output:

```sh
James
Alex
Harry
Anna
Emma
Chris
```

Another common scenario is if we have a file with a different delimiter than we want. Well use the same file about (with ":", "-") delimiters, but change them to a csv ",".

We use the `OFS` output field separator to do this.

`#ChangeOutputDelim.awk`
```awk
#!/usr/bin/awk -f

# We can change the output delim into a comma (csv)
BEGIN {
	# Declare many different field sep as an input
	FS="[:-]";
	# Change output delimiter to , 
	OFS=",";
}
{
	print $1, $2, $3;
}
```
Output:

```sh
James,50,39
Alex,96,58
Harry,33,52
Anna,59,63
Emma,93,23
Chris,43,75
```

Another data situation is where we have different number of fields per row/record. The following dataset has a mix of 3 or 4 fields.

`#data/diffFields.data`

```sh
Mark 80 38 40
James 49 30
Chris 44 39 20
Anna 33 49
Rachel 55 94 39
Harry 48 38 55
Mike 57 48 39
Nick 69 30 95
Michael 49 64 43
Natalie 42 54 71
Hannah 23 95
```

And we want to count those rows which have 4 fields and take an average of those values in the 4th field.

`#VariableFields.awk`

```awk
#!/usr/bin/awk -f

# Count the number of records with 4 fields
# Compute the average of the fourth field
BEGIN {
	FS=" ";
	# Declare variables
	fourthFieldCount = 0;
	fourthFieldSum = 0;
}
{
	# NF = Number of fields
	if (NF == 4) {
		fourthFieldCount += 1;
		fourthFieldSum += $4;
	}
}
END {
	# Print the count and average (where the fourth column exists)
	printf("%8s %3d\n", "COUNT", fourthFieldCount);
	printf("%8s %3d\n", "AVERAGE", fourthFieldSum/fourthFieldCount);
}
```

Output:

```sh
   COUNT   8
 AVERAGE  50
```

Alternatively, we might want to exit the program if we find an input line with less than 4 fields. This might help to prevent any bugs when running our program.

Using the same dataset as above we run the following script.

`#ExitWithBadData.awk`

```awk
#!/usr/bin/awk -f

# This program will exit if it finds less than 4 fields in a input line
{
	if (NF < 4) {
		print "Exiting program...";
		exit
	}
	print $0;
}
```

Output:

```sh
Mark 80 38 40
Exiting program...
```