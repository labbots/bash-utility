---
title : String 
description : Functions for string operations and manipulations. 
date : 2020-06-12T01:11:01+01:00
lastmod : 2020-06-22T15:07:45+01:00
---
<!-- START generate_readme.sh generated SHDOC please keep comment here to allow auto update -->


Functions for string operations and manipulations.

### Table of Contents

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

---

### string::trim()

Strip whitespace from the beginning and end of a string.

#### Arguments

- **$1** (string): The string to be trimmed.

#### Exit codes

- **0**:  If successful.
- **2**: Function missing arguments.

#### Output on stdout

- The trimmed string.

#### Example

```bash
echo "$(string::trim "   Hello World!   ")"
#Output
Hello World!
```

---

### string::split()

Split a string to array by a delimiter.

#### Arguments

- **$1** (string): The input string.
- **$2** (string): The delimiter string.

#### Exit codes

- **0**:  If successful.
- **2**: Function missing arguments.

#### Output on stdout

- Returns an array of strings created by splitting the string parameter by the delimiter.

#### Example

```bash
array=( $(string::split "a,b,c" ",") )
printf "%s" "$(string::split "Hello!World" "!")"
#Output
Hello
World
```

---

### string::lstrip()

Strip characters from the beginning of a string.

#### Arguments

- **$1** (string): The input string.
- **$2** (string): The characters you want to strip.

#### Exit codes

- **0**:  If successful.
- **2**: Function missing arguments.

#### Output on stdout

- Returns the modified string.

#### Example

```bash
echo "$(string::lstrip "Hello World!" "He")"
#Output
llo World!
```

---

### string::rstrip()

Strip characters from the end of a string.

#### Arguments

- **$1** (string): The input string.
- **$2** (string): The characters you want to strip.

#### Exit codes

- **0**:  If successful.
- **2**: Function missing arguments.

#### Output on stdout

- Returns the modified string.

#### Example

```bash
echo "$(string::rstrip "Hello World!" "d!")"
#Output
Hello Worl
```

---

### string::to_lower()

Make a string lowercase.

#### Arguments

- **$1** (string): The input string.

#### Exit codes

- **0**:  If successful.
- **2**: Function missing arguments.

#### Output on stdout

- Returns the lowercased string.

#### Example

```bash
echo "$(string::to_lower "HellO")"
#Output
hello
```

---

### string::to_upper()

Make a string all uppercase.

#### Arguments

- **$1** (string): The input string.

#### Exit codes

- **0**:  If successful.
- **2**: Function missing arguments.

#### Output on stdout

- Returns the uppercased string.

#### Example

```bash
echo "$(string::to_upper "HellO")"
#Output
HELLO
```

---

### string::contains()

Check whether the search string exists within the input string.

#### Arguments

- **$1** (string): The input string.
- **$2** (string): The search key.

#### Exit codes

- **0**:  If match found.
- **1**:  If no match found.
- **2**: Function missing arguments.

#### Example

```bash
string::contains "Hello World!" "lo"
```

---

### string::starts_with()

Check whether the input string starts with key string.

#### Arguments

- **$1** (string): The input string.
- **$2** (string): The search key.

#### Exit codes

- **0**:  If match found.
- **1**:  If no match found.
- **2**: Function missing arguments.

#### Example

```bash
string::starts_with "Hello World!" "He"
```

---

### string::ends_with()

Check whether the input string ends with key string.

#### Arguments

- **$1** (string): The input string.
- **$2** (string): The search key.

#### Exit codes

- **0**:  If match found.
- **1**:  If no match found.
- **2**: Function missing arguments.

#### Example

```bash
string::ends_with "Hello World!" "d!"
```

---

### string::regex()

Check whether the input string matches the given regex.

#### Arguments

- **$1** (string): The input string.
- **$2** (string): The search key.

#### Exit codes

- **0**:  If match found.
- **1**:  If no match found.
- **2**: Function missing arguments.

#### Example

```bash
string::regex "HELLO" "^[A-Z]*$"
```

---

<!-- END generate_readme.sh generated SHDOC please keep comment here to allow auto update -->
