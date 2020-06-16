---
title : Json 
description : Simple json manipulation. These functions does not completely replace `jq` in any way. 
date : 2020-06-12T01:11:01+01:00
lastmod : 2020-06-16T15:14:52+01:00
---
<!-- START generate_readme.sh generated SHDOC please keep comment here to allow auto update -->


Simple json manipulation. These functions does not completely replace `jq` in any way.

### Table of Contents

- [json::get_value()](#jsonget_value)

---

### json::get_value()

Extract value from json based on key and position.
Input to the function can be a pipe output, here-string or file.

#### Arguments

- **$1** (string): id of the field to fetch.
- **$2** (int): position of value to extract.Defaults to 1.(optional)

#### Exit codes

- **0**:  If match successful.
- **2**: Function missing arguments.

#### Output on stdout

- string value of extracted key.

#### Example

```bash
json::get_value "id" "1" < json_file
json::get_value "id" <<< "${json_var}"
echo "{\"data\":{\"id\":\"123\",\"value\":\"name string\"}}" | json::get_value "id"
```

---

<!-- END generate_readme.sh generated SHDOC please keep comment here to allow auto update -->
