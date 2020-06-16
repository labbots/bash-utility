---
title : Miscellaneous 
description : Set of miscellaneous helper functions. 
date : 2020-06-12T01:11:01+01:00
lastmod : 2020-06-16T15:14:52+01:00
---
<!-- START generate_readme.sh generated SHDOC please keep comment here to allow auto update -->


Set of miscellaneous helper functions.

### Table of Contents

- [misc::check_internet_connection()](#misccheck_internet_connection)
- [misc::get_pid()](#miscget_pid)
- [misc::get_uid()](#miscget_uid)
- [misc::generate_uuid()](#miscgenerate_uuid)

---

### misc::check_internet_connection()

Check if internet connection is available.

*Function has no arguments.*

#### Exit codes

- **0**:  If script can connect to internet.
- **1**: If script cannot access internet.

#### Example

```bash
misc::check_internet_connection
```

---

### misc::get_pid()

Get list of process ids based on process name.

#### Arguments

- **$1** (Name): of the process to search.

#### Exit codes

- **0**:  If match successful.
- **2**: Function missing arguments.

#### Output on stdout

- list of process ids.

#### Example

```bash
misc::get_pid "chrome"
#Ouput
25951
26043
26528
26561
```

---

### misc::get_uid()

Get user id based on username.

#### Arguments

- **$1** (username): to search.

#### Exit codes

- **0**:  If match successful.
- **2**: Function missing arguments.

#### Output on stdout

- string uid for the username.

#### Example

```bash
misc::get_uid "labbots"
#Ouput
1000
```

---

### misc::generate_uuid()

Generate random uuid.

*Function has no arguments.*

#### Exit codes

- **0**:  If match successful.

#### Output on stdout

- random generated uuid.

#### Example

```bash
misc::generate_uuid
#Ouput
65bc64d1-d355-4ffc-a9d9-dc4f3954c34c
```

---

<!-- END generate_readme.sh generated SHDOC please keep comment here to allow auto update -->
