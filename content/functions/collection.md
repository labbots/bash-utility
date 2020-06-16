---
title : Collection 
description : (Experimental) Functions to iterates over a list of elements, yielding each in turn to an iteratee function. 
date : 2020-06-12T01:11:01+01:00
lastmod : 2020-06-16T15:14:52+01:00
---
<!-- START generate_readme.sh generated SHDOC please keep comment here to allow auto update -->


(Experimental) Functions to iterates over a list of elements, yielding each in turn to an iteratee function.

### Table of Contents

- [collection::each()](#collectioneach)
- [collection::every()](#collectionevery)
- [collection::filter()](#collectionfilter)
- [collection::find()](#collectionfind)
- [collection::invoke()](#collectioninvoke)
- [collection::map()](#collectionmap)
- [collection::reject()](#collectionreject)
- [collection::some()](#collectionsome)

---

### collection::each()

Iterates over elements of collection and invokes iteratee for each element.
Input to the function can be a pipe output, here-string or file.

#### Arguments

- **$1** (string): Iteratee function.

#### Exit codes

- **0**:  If successful.
- **2**: Function missing arguments.
- other exitcode returned by iteratee.

#### Output on stdout

- Output of iteratee function.

#### Example

```bash
test_func(){
   printf "print value: %s\n" "$1"
   return 0
 }
arr1=("a b" "c d" "a" "d")
printf "%s\n" "${arr1[@]}" | collection::each "test_func"
collection::each "test_func"  < <(printf "%s\n" "${arr1[@]}") #alternative approach
#output
 print value: a b
 print value: c d
 print value: a
 print value: d
```

#### Example

```bash
# If other function from this library is already used to process the array.
# Then following method could be used to pass the array to the function.
out=("$(array::dedupe "${arr1[@]}")")
collection::each "test_func"  <<< "${out[@]}"
```

---

### collection::every()

Checks if iteratee function returns truthy for all elements of collection. Iteration is stopped once predicate returns false.
Input to the function can be a pipe output, here-string or file.

#### Arguments

- **$1** (string): Iteratee function.

#### Exit codes

- **0**:  If successful.
- **1**: If iteratee function fails.
- **2**: Function missing arguments.

#### Example

```bash
arri=("1" "2" "3" "4")
printf "%s\n" "${arri[@]}" | collection::every "variable::is_numeric"
```

---

### collection::filter()

Iterates over elements of array, returning all elements where iteratee returns true.
Input to the function can be a pipe output, here-string or file.

#### Arguments

- **$1** (string): Iteratee function.

#### Exit codes

- **0**:  If successful.
- **2**: Function missing arguments.

#### Output on stdout

- array values matching the iteratee function.

#### Example

```bash
arri=("1" "2" "3" "a")
printf "%s\n" "${arri[@]}" | collection::filter "variable::is_numeric"
#output
1
2
3
```

---

### collection::find()

Iterates over elements of collection, returning the first element where iteratee returns true.
Input to the function can be a pipe output, here-string or file.

#### Arguments

- **$1** (string): Iteratee function.

#### Exit codes

- **0**:  If successful.
- **1**: If no match found.
- **2**: Function missing arguments.

#### Output on stdout

- first array value matching the iteratee function.

#### Example

```bash
arr=("1" "2" "3" "a")
check_a(){
    [[ "$1" = "a" ]]
}
printf "%s\n" "${arr[@]}" | collection::find "check_a"
#Output
a
```

---

### collection::invoke()

Invokes the iteratee with each element passed as argument to the iteratee.
Input to the function can be a pipe output, here-string or file.

#### Arguments

- **$1** (string): Iteratee function.

#### Exit codes

- **0**:  If successful.
- **2**: Function missing arguments.
- other exitcode returned by iteratee.

#### Output on stdout

- Output from the iteratee function.

#### Example

```bash
opt=("-a" "-l")
printf "%s\n" "${opt[@]}" | collection::invoke "ls"
```

---

### collection::map()

Creates an array of values by running each element in array through iteratee.
Input to the function can be a pipe output, here-string or file.

#### Arguments

- **$1** (string): Iteratee function.

#### Exit codes

- **0**:  If successful.
- **2**: Function missing arguments.
- other exitcode returned by iteratee.

#### Output on stdout

- Output result of iteratee on value.

#### Example

```bash
arri=("1" "2" "3")
add_one(){
  i=${1}
  i=$(( i + 1 ))
  printf "%s\n" "$i"
}
printf "%s\n" "${arri[@]}" | collection::map "add_one"
```

---

### collection::reject()

The opposite of filter function; this method returns the elements of collection that iteratee does not return true.
Input to the function can be a pipe output, here-string or file.

#### Arguments

- **$1** (string): Iteratee function.

#### Exit codes

- **0**:  If successful.
- **2**: Function missing arguments.

#### Output on stdout

- array values not matching the iteratee function.

#### Example

```bash
arri=("1" "2" "3" "a")
printf "%s\n" "${arri[@]}" | collection::reject "variable::is_numeric"
#Ouput
a
```

#### See also

- [collection::filter](#collectionfilter)

---

### collection::some()

Checks if iteratee returns true for any element of the array.
Input to the function can be a pipe output, here-string or file.

#### Arguments

- **$1** (string): Iteratee function.

#### Exit codes

- **0**:  If match successful.
- **1**: If no match found.
- **2**: Function missing arguments.

#### Example

```bash
arr=("a" "b" "3" "a")
printf "%s\n" "${arr[@]}" | collection::reject "variable::is_numeric"
```

---

<!-- END generate_readme.sh generated SHDOC please keep comment here to allow auto update -->
