---
title : Format 
description : Functions to format provided input. 
date : 2020-06-12T01:11:01+01:00
lastmod : 2020-06-22T18:09:49+01:00
---
<!-- START generate_readme.sh generated SHDOC please keep comment here to allow auto update -->


Functions to format provided input.

### Table of Contents

- [format::human_readable_seconds()](#formathuman_readable_seconds)
- [format::bytes_to_human()](#formatbytes_to_human)
- [format::strip_ansi()](#formatstrip_ansi)
- [format::text_center()](#formattext_center)
- [format::report()](#formatreport)
- [format::trim_text_to_term()](#formattrim_text_to_term)

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

### format::strip_ansi()

Remove Ansi escape sequences from given text.

#### Arguments

- **$1** (string): Input text to be ansi stripped.

#### Exit codes

- **0**:  If successful.

#### Output on stdout

- Ansi stripped text.

#### Example

```bash
format::strip_ansi "\e[1m\e[91mThis is bold red text\e(B\e[m.\e[92mThis is green text.\e(B\e[m"
#Output
This is bold red text.This is green text.
```

---

### format::text_center()

Prints the given text to centre of terminal.

#### Arguments

- **$1** (string): Text to be printed.
- **$2** (string): Filler symbol to be added to prefix and suffix of the text (optional). Defaults to space as filler.

#### Exit codes

- **0**:  If successful.
- **2**: Function missing arguments.

#### Output on stdout

- formatted text.

#### Example

```bash
format::text_center "This text is in centre of the terminal." "-"
```

---

### format::report()

Format String to print beautiful report.

#### Arguments

- **$1** (string): Text to be printed on the left.
- **$2** (string): Text to be printed within the square brackets.

#### Exit codes

- **0**:  If successful.
- **2**: Function missing arguments.

#### Output on stdout

- formatted text.

#### Example

```bash
format::report "Initialising mission state" "Success"
#Output
Initialising mission state ....................................................................[ Success ]
```

---

### format::trim_text_to_term()

Trim given text to width of the terminal window.

#### Arguments

- **$1** (string): Text of first sentence.
- **$2** (string): Text of second sentence (optional).

#### Exit codes

- **0**:  If successful.
- **2**: Function missing arguments.

#### Output on stdout

- trimmed text.

#### Example

```bash
format::trim_text_to_term "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat." "This is part of second sentence."
#Output
Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod..This is part of second sentence.
```

---

<!-- END generate_readme.sh generated SHDOC please keep comment here to allow auto update -->
