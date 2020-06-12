---
title : Variable 
description : Functions for handling variables. 
date : 2020-06-12T01:11:01+01:00
lastmod : 2020-06-12T01:11:01+01:00
---
<!-- START generate_readme.sh generated SHDOC please keep comment here to allow auto update -->


Functions for handling variables.

### Table of Contents

- [variable::is_array()](#variableis_array)
- [variable::is_numeric()](#variableis_numeric)
- [variable::is_int()](#variableis_int)
- [variable::is_float()](#variableis_float)
- [variable::is_bool()](#variableis_bool)
- [variable::is_true()](#variableis_true)
- [variable::is_false()](#variableis_false)

---

### variable::is_array()

Check if given variable is array.
Pass the variable name instead of value of the variable.

#### Arguments

- **$1** (string): name of the variable to check.

#### Exit codes

- **0**:  If input is array.
- **1**: If input is not an array.

#### Example

```bash
arr=("a" "b" "c")
variable::is_array "arr"
#Output
0
```

---

### variable::is_numeric()

Check if given variable is a number.

#### Arguments

- **$1** (mixed): Value of variable to check.

#### Exit codes

- **0**:  If input is number.
- **1**: If input is not a number.

#### Example

```bash
variable::is_numeric "1234"
#Output
0
```

---

### variable::is_int()

Check if given variable is an integer.

#### Arguments

- **$1** (mixed): Value of variable to check.

#### Exit codes

- **0**:  If input is an integer.
- **1**: If input is not an integer.

#### Example

```bash
variable::is_int "+1234"
#Output
0
```

---

### variable::is_float()

Check if given variable is a float.

#### Arguments

- **$1** (mixed): Value of variable to check.

#### Exit codes

- **0**:  If input is a float.
- **1**: If input is not a float.

#### Example

```bash
variable::is_float "+1234.0"
#Output
0
```

---

### variable::is_bool()

Check if given variable is a boolean.

#### Arguments

- **$1** (mixed): Value of variable to check.

#### Exit codes

- **0**:  If input is a boolean.
- **1**: If input is not a boolean.

#### Example

```bash
variable::is_bool "true"
#Output
0
```

---

### variable::is_true()

Check if given variable is a true.

#### Arguments

- **$1** (mixed): Value of variable to check.

#### Exit codes

- **0**:  If input is true.
- **1**: If input is not true.

#### Example

```bash
variable::is_true "true"
#Output
0
```

---

### variable::is_false()

Check if given variable is false.

#### Arguments

- **$1** (mixed): Value of variable to check.

#### Exit codes

- **0**:  If input is false.
- **1**: If input is not false.

#### Example

```bash
variable::is_false "false"
#Output
0
```

---

<!-- END generate_readme.sh generated SHDOC please keep comment here to allow auto update -->
