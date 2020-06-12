---
title : Interaction 
description : Functions to enable interaction with the user. 
date : 2020-06-12T01:11:01+01:00
lastmod : 2020-06-12T01:11:01+01:00
---
<!-- START generate_readme.sh generated SHDOC please keep comment here to allow auto update -->


Functions to enable interaction with the user.

### Table of Contents

- [interaction::prompt_yes_no()](#interactionprompt_yes_no)
- [interaction::prompt_response()](#interactionprompt_response)

---

### interaction::prompt_yes_no()

Prompt yes or no question to the user.

#### Arguments

- **$1** (string): The question to be prompted to the user.
- **$2** (string): default answer \[yes/no\] (optional).

#### Exit codes

- **0**:  If user responds with yes.
- **1**:  If user responds with no.
- **2**: Function missing arguments.

#### Output on stdout

- question to be prompted to the user.

#### Example

```bash
interaction::prompt_yes_no "Are you sure to proceed" "yes"
#Output
Are you sure to proceed (y/n)? [y]
```

---

### interaction::prompt_response()

Prompt question to the user.

#### Arguments

- **$1** (string): The question to be prompted to the user.
- **$2** (string): default answer (optional).

#### Exit codes

- **0**:  If user responds with answer.
- **2**: Function missing arguments.

#### Output on stdout

- question to be prompted to the user.

#### Example

```bash
interaction::prompt_response "Choose directory to install" "/home/path"
#Output
Choose directory to install? [/home/path]
```

---

<!-- END generate_readme.sh generated SHDOC please keep comment here to allow auto update -->
