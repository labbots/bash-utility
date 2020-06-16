---
title : Format 
description : Functions to format provided input. 
date : 2020-06-12T01:11:01+01:00
lastmod : 2020-06-16T15:14:52+01:00
---
<!-- START generate_readme.sh generated SHDOC please keep comment here to allow auto update -->


Functions to format provided input.

### Table of Contents

- [format::human_readable_seconds()](#formathuman_readable_seconds)
- [format::bytes_to_human()](#formatbytes_to_human)

---

### format::human_readable_seconds()

Format seconds to human readable format.

#### Arguments

- **$1** (int): number of seconds.

#### Exit codes

- **0**:  If successful.
- **2**: Function missing arguments.

#### Output on stdout

- formatted time string.

#### Example

```bash
echo "$(format::human_readable_seconds "356786")"
#Output
4 days 3 hours 6 minute(s) and 26 seconds
```

---

### format::bytes_to_human()

Format bytes to human readable format.

#### Arguments

- **$1** (int): size in bytes.

#### Exit codes

- **0**:  If successful.
- **2**: Function missing arguments.

#### Output on stdout

- formatted file size string.

#### Example

```bash
echo "$(format::bytes_to_human "2250")"
#Output
2.19 KB
```

---

<!-- END generate_readme.sh generated SHDOC please keep comment here to allow auto update -->
