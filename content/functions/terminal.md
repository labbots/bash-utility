---
title : Terminal 
description : Set of useful terminal functions. 
date : 2020-06-12T01:11:01+01:00
lastmod : 2020-06-12T01:11:01+01:00
---
<!-- START generate_readme.sh generated SHDOC please keep comment here to allow auto update -->


Set of useful terminal functions.

### Table of Contents

- [terminal::is_term()](#terminalis_term)
- [terminal::detect_profile()](#terminaldetect_profile)
- [terminal::clear_line()](#terminalclear_line)

---

### terminal::is_term()

Check if script is run in terminal.

*Function has no arguments.*

#### Exit codes

- **0**:  If script is run on terminal.
- **1**: If script is not run on terminal.

---

### terminal::detect_profile()

Detect profile rc file for zsh and bash of current script running user.

*Function has no arguments.*

#### Exit codes

- **0**:  If script is run on terminal.
- **1**: If script is not run on terminal.

#### Output on stdout

- path to the profile file.

---

### terminal::clear_line()

Clear the output in terminal on the specified line number.
This function clears line only on terminal.

#### Arguments

- **$1** (Line): number to clear. Defaults to 1. (optional)

#### Exit codes

- **0**:  If script is run on terminal.

#### Output on stdout

- clear line ansi code.

---

<!-- END generate_readme.sh generated SHDOC please keep comment here to allow auto update -->
