---
title : Debug 
description : Functions to facilitate debugging scripts. 
date : 2020-06-22T13:10:41+01:00
lastmod : 2020-06-22T13:10:41+01:00
---
<!-- START generate_readme.sh generated SHDOC please keep comment here to allow auto update -->


Functions to facilitate debugging scripts.

### Table of Contents

- [debug::print_array()](#debugprint_array)
- [debug::print_ansi()](#debugprint_ansi)

---

### debug::print_array()

Prints the content of array as key value pair for easier debugging.
Pass the variable name of the array instead of value of the variable.

#### Arguments

- **$1** (string): variable name of the array.

#### Output on stdout

- Formatted key value of array.

#### Example

```bash
array=(foo bar baz)
printf "Array\n"
printarr "array"
declare -A assoc_array
assoc_array=([foo]=bar [baz]=foobar)
printf "Assoc Array\n"
printarr "assoc_array"
#Output
Array
0 = foo
1 = bar
2 = baz
Assoc Array
baz = foobar
foo = bar
```

---

### debug::print_ansi()

Function to print ansi escape sequence as is.
This function helps debug ansi escape sequence in text by displaying the escape codes.

#### Arguments

- **$1** (string): input with ansi escape sequence.

#### Output on stdout

- Ansi escape sequence printed in output as is.

#### Example

```bash
txt="$(tput bold)$(tput setaf 9)This is bold red text$(tput sgr0).$(tput setaf 10)This is green text$(tput sgr0)"
debug::print_ansi "$txt"
#Output
\e[1m\e[91mThis is bold red text\e(B\e[m.\e[92mThis is green text\e(B\e[m
```

---

<!-- END generate_readme.sh generated SHDOC please keep comment here to allow auto update -->
