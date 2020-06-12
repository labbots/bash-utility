---
title : Check 
description : Helper functions. 
date : 2020-06-12T01:11:01+01:00
lastmod : 2020-06-12T01:11:01+01:00
---
<!-- START generate_readme.sh generated SHDOC please keep comment here to allow auto update -->


Helper functions.

### Table of Contents

- [check::command_exists()](#checkcommand_exists)
- [check::is_sudo()](#checkis_sudo)

---

### check::command_exists()

Check if the command exists in the system.

#### Arguments

- **$1** (string): Command name to be searched.

#### Exit codes

- **0**:  If the command exists.
- **1**:  If the command does not exist.
- **2**: Function missing arguments.

#### Example

```bash
check::command_exists "tput"
```

---

### check::is_sudo()

Check if the script is executed with sudo privilege.

*Function has no arguments.*

#### Exit codes

- **0**:  If the script is executed with root privilege.
- **1**:  If the script is not executed with root privilege

#### Example

```bash
check::is_sudo
```

---

<!-- END generate_readme.sh generated SHDOC please keep comment here to allow auto update -->
