# CaseStudy: List of articles

dataset can be found in `#data/articles.csv`.

This tutorial we will aim to do data analysis in `awk` and combining all other shell tools such as `grep`, `cut`, `uniq`, `sort` etc.

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
awk -F "," '{ if (NR > 1) print $1}' articles.csv | sort -n | uniq -c | sort -nr | head -n 5
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



