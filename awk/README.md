# AWK - Tutorial

We look at some of the basic structure of the awk programming language.

Ref: https://www.grymoire.com/Unix/Awk.html#uh-0

## Basic Structure

pattern { action }

Awk is line oriented, each line is read as an input. If the condition is true then the action is taken.

`BEGIN` is run before any input is read and `END` is executed after all input has been read.

```sh
BEGIN { print "START" }
		{ print $0 }
END { print "STOP" }
```

## AutoIncrement/Autodecrement Operators

```sh
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