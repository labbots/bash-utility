<h1 align="center">Bash Utilites</h1>

<p align="center">
<a href="https://github.com/labbots/bash-utility/blob/master/LICENSE"><img src="https://img.shields.io/github/license/labbots/bash-utility.svg?style=for-the-badge" alt="License"></a>
<a href="https://www.codacy.com/manual/labbots/bash-utility?utm_source=github.com&amp;utm_medium=referral&amp;utm_content=labbots/bash-utility&amp;utm_campaign=Badge_Grade"><img src="https://img.shields.io/codacy/grade/99fbe8d389254b6ebb37899ce89658e3?style=for-the-badge"/></a>
</p>
Bash library which provides utility functions and helpers for functional programming in Bash.

<!-- START generate_readme.sh generated TOC please keep comment here to allow auto update -->
<!-- DO NOT EDIT THIS SECTION, INSTEAD RE-RUN generate_readme.sh TO UPDATE -->
## Table of Contents

- [Array](#array)
  - [array::contains()](#arraycontains)
  - [array::dedupe()](#arraydedupe)
  - [array::join()](#arrayjoin)
  - [array::reverse()](#arrayreverse)
  - [array::random_element()](#arrayrandom_element)
- [String](#string)
  - [string::trim()](#stringtrim)
  - [string::split()](#stringsplit)
  - [string::lstrip()](#stringlstrip)
  - [string::rstrip()](#stringrstrip)
  - [string::to_lower()](#stringto_lower)
  - [string::to_upper()](#stringto_upper)
  - [string::contains()](#stringcontains)
  - [string::starts_with()](#stringstarts_with)
  - [string::ends_with()](#stringends_with)
  - [string::regex()](#stringregex)
- [License](#license)

<!-- END generate_readme.sh generated TOC please keep comment here to allow auto update -->

<!-- START generate_readme.sh generated SHDOC please keep comment here to allow auto update -->
<!-- DO NOT EDIT THIS SECTION, INSTEAD RE-RUN generate_readme.sh TO UPDATE -->
## Array

Functions for array operations and manipulations.



### array::contains()

Check if item exists in the given array.

#### Example

```bash
array=("a" "b" "c")
array::contains "c" ${array[@]}
#Output
0
```

#### Arguments

- **$1** (mixed): Item to search (needle).
- **$2** (array): array to be searched (haystack).

#### Exit codes

- **0**:  If successful.
- **1**: If no match found in the array.
- **2**: Function missing arguments.

### array::dedupe()

Remove duplicate items from the array

#### Example

```bash
array=("a" "b" "a" "c")
printf "%s" "$(array::dedupe ${array[@]})"
#Output
a b c
```

#### Arguments

- **$1** (array): Array to be deduped.

#### Exit codes

- **0**:  If successful.
- **2**: Function missing arguments.

#### Output on stdout

- Deduplicated array.

### array::join()

Join array elements with a string.

#### Example

```bash
array=("a" "b" "c" "d")
printf "%s" "$(array::join "," "${array[@]}")"
#Output
a,b,c,d
printf "%s" "$(array::join "" "${array[@]}")"
#Output
abcd
```

#### Arguments

- **$1** (string): String to join the array elements (glue).
- **$2** (array): array to be joined with glue string.

#### Exit codes

- **0**:  If successful.
- **2**: Function missing arguments.

#### Output on stdout

- String containing a string representation of all the array elements in the same order,with the glue string between each element.

### array::reverse()

Return an array with elements in reverse order.

#### Example

```bash
array=(1 2 3 4 5)
printf "%s" "$(array::reverse "${array[@]}")"
#Output
5 4 3 2 1
```

#### Arguments

- **$1** (array): The input array.

#### Exit codes

- **0**:  If successful.
- **2**: Function missing arguments.

#### Output on stdout

- The reversed array.

### array::random_element()

Returns a random item from the array.

#### Example

```bash
array=("a" "b" "c" "d")
printf "%s\n" "$(array::random_element "${array[@]}")"
#Output
c
```

#### Arguments

- **$1** (array): The input array.

#### Exit codes

- **0**:  If successful.
- **2**: Function missing arguments.

#### Output on stdout

- Random item out of the array.

## String

Functions for string operations and manipulations.



### string::trim()

Strip whitespace from the beginning and end of a string.

#### Example

```bash
echo "$(string::trim "   Hello World!   ")"
#Output
Hello World!
```

#### Arguments

- **$1** (The): string that will be trimmed.

#### Exit codes

- **0**:  If successful.
- **2**: Function missing arguments.

#### Output on stdout

- The trimmed string.

### string::split()

Split a string to array by a delimiter.

#### Example

```bash
printf "%s" "$(string::split "Hello!World" "!")"
#Output
Hello
World
```

#### Arguments

- **$1** (string): The input string.
- **$2** (string): The delimiter string.

#### Exit codes

- **0**:  If successful.
- **2**: Function missing arguments.

#### Output on stdout

- Returns an array of strings created by splitting the string parameter by the delimiter.

### string::lstrip()

Strip characters from the beginning of a string.

#### Example

```bash
echo "$(string::lstrip "Hello World!" "He")"
#Output
llo World!
```

#### Arguments

- **$1** (string): The input string.
- **$2** (string): The characters you want to strip.

#### Exit codes

- **0**:  If successful.
- **2**: Function missing arguments.

#### Output on stdout

- Returns the modified string.

### string::rstrip()

Strip characters from the end of a string.

#### Example

```bash
echo "$(string::rstrip "Hello World!" "d!")"
#Output
Hello Worl
```

#### Arguments

- **$1** (string): The input string.
- **$2** (string): The characters you want to strip.

#### Exit codes

- **0**:  If successful.
- **2**: Function missing arguments.

#### Output on stdout

- Returns the modified string.

### string::to_lower()

Make a string lowercase.

#### Example

```bash
echo "$(string::to_lower "HellO")"
#Output
hello
```

#### Arguments

- **$1** (string): The input string.

#### Exit codes

- **0**:  If successful.
- **2**: Function missing arguments.

#### Output on stdout

- Returns the lowercased string.

### string::to_upper()

Make a string all uppercase.

#### Example

```bash
echo "$(string::to_upper "HellO")"
#Output
HELLO
```

#### Arguments

- **$1** (string): The input string.

#### Exit codes

- **0**:  If successful.
- **2**: Function missing arguments.

#### Output on stdout

- Returns the uppercased string.

### string::contains()

Check whether the search string exists within the input string.

#### Example

```bash
string::contains "Hello World!" "lo"
```

#### Arguments

- **$1** (string): The input string.
- **$2** (string): The search key.

#### Exit codes

- **0**:  If match found.
- **1**:  If no match found.
- **2**: Function missing arguments.

### string::starts_with()

Check whether the input string starts with key string.

#### Example

```bash
string::starts_with "Hello World!" "He"
```

#### Arguments

- **$1** (string): The input string.
- **$2** (string): The search key.

#### Exit codes

- **0**:  If match found.
- **1**:  If no match found.
- **2**: Function missing arguments.

### string::ends_with()

Check whether the input string ends with key string.

#### Example

```bash
string::ends_with "Hello World!" "d!"
```

#### Arguments

- **$1** (string): The input string.
- **$2** (string): The search key.

#### Exit codes

- **0**:  If match found.
- **1**:  If no match found.
- **2**: Function missing arguments.

### string::regex()

Check whether the input string matches the given regex.

#### Example

```bash
string::regex "HELLO" "^[A-Z]*$"
```

#### Arguments

- **$1** (string): The input string.
- **$2** (string): The search key.

#### Exit codes

- **0**:  If match found.
- **1**:  If no match found.
- **2**: Function missing arguments.

<!-- END generate_readme.sh generated SHDOC please keep comment here to allow auto update -->

## License

[MIT](https://github.com/labbots/google-drive-upload/blob/master/LICENSE)
