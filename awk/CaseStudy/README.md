# CaseStudy: List of articles

Dataset can be found in `articles.csv`.

In this tutorial, we will aim to do data analysis in `awk` and combining all other shell tools such as `grep`, `cut`, `uniq`, `sort` etc.

### Preview of data

Its too many fields to print it out here but try running the following, to print the first 5 rows.

```sh
$ head articles.csv
```

### Questions

In the following subsections we aim to ask some typical data analytical questions about the dataset that contains articles.

#### Which date had the most articles posted?

We can use the `NR` builtin variable (Number Records) to filter out the header with `NR > 1`.

```sh
$ awk -F "," '{ if (NR > 1) print $1}' articles.csv | sort -n | uniq -c | sort -nr | head -n 5
```

Output:

```sh
   6 23 Jan 2017
   5 25 Jan 2017
   5 16 Jan 2017
   4 31 Jan 2017
   4 30 Jan 2017
```

Explanation:

First awk code prints all rows except the first (header), then sorts by the date `sort -n`. The `uniq -c` is used as a counter tool, and `sort -nr` then sorts by the count in desc order. Finally `head -n 5` takes the top 5 counts.

#### What is the average word count per article posted?

Here we use `NF` (number of fields) to quickly determine where the word count column is in the data (as its the last one $NF will print the last column).

```awk
#!/usr/bin/awk -f

# We compute the average word count. Word count is the last field so we can use $NF (number of fields)
BEGIN {
	FS = ",";
	# Declare counter
	count = 0;
}
{
	# Ignore First row:
	if (NR == 1) {
		# Skips row
		next;
	}
	# $NF will print last field, which is word count
	count += $NF;
}
END {
	printf("%8s %5d\n", "AVG WC", count / NR);
}
```

Running the program we get the following output:

```sh
$ ./AverageWordCount.awk articles.csv
AVG WC   881
```

We could make this slightly more complex. What if we wanted to know the average wordcount for those records which had a comment vs those without.

```awk
#!/usr/bin/awk -f

# We look at comparing the avg word count with the rec with a comment vs without. $5 field contains comment count.

BEGIN {
	FS = ",";
	# Declare counter
	countComment = 0;
	countNoComment = 0;
}
{
	# Ignore First row:
	if (NR == 1) {
		# Skips row
		next;
	}
	if ($5 > 0) {
		# $NF will print last field, which is word count
		countComment += $NF;
		}
	else if ($5 == 0) {
		countNoComment += $NF;
	}
}
END {
	printf("%10s\n", "AVERAGE WC");
	printf("%10s %5d\n", "COMMENT", countComment / NR);
	printf("%10s %5d\n", "NO COMMENT", countNoComment / NR);
}
```

Running the program we get the following output:

```sh
$ ./AverageWordCount.awk articles.csv
AVERAGE WC
   COMMENT   636
NO COMMENT   169
```
