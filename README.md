<h1 align="center">Bash Utilites</h1>

<p align="center">
<a href="https://github.com/labbots/bash-utility/blob/master/LICENSE"><img src="https://img.shields.io/github/license/labbots/bash-utility.svg?style=for-the-badge" alt="License"></a>
<a href="https://www.codacy.com/manual/labbots/bash-utility?utm_source=github.com&amp;utm_medium=referral&amp;utm_content=labbots/bash-utility&amp;utm_campaign=Badge_Grade"><img src="https://img.shields.io/codacy/grade/99fbe8d389254b6ebb37899ce89658e3?style=for-the-badge"/></a>
</p>
<p align="center">
<img src="image/logo.png" height="250"/>
</p>
Bash library which provides utility functions and helpers for functional programming in Bash.

<!-- START generate_readme.sh generated TOC please keep comment here to allow auto update -->
<!-- DO NOT EDIT THIS SECTION, INSTEAD RE-RUN generate_readme.sh TO UPDATE -->
## Table of Contents

- [Installation](#installation)
  - [Method 1 - Git Submodules](#method-1---git-submodules)
  - [Method 2 - Git Clone](#method-2---git-clone)
- [Usage](#usage)
- [Array](#array)
  - [array::contains()](#arraycontains)
  - [array::dedupe()](#arraydedupe)
  - [array::is_empty()](#arrayis_empty)
  - [array::join()](#arrayjoin)
  - [array::reverse()](#arrayreverse)
  - [array::random_element()](#arrayrandom_element)
- [Check](#check)
  - [check::command_exists()](#checkcommand_exists)
  - [check::is_sudo()](#checkis_sudo)
- [Date](#date)
  - [date::now()](#datenow)
  - [date::epoc()](#dateepoc)
  - [date::add_days_from()](#dateadd_days_from)
  - [date::add_months_from()](#dateadd_months_from)
  - [date::add_years_from()](#dateadd_years_from)
  - [date::add_weeks_from()](#dateadd_weeks_from)
  - [date::add_hours_from()](#dateadd_hours_from)
  - [date::add_minutes_from()](#dateadd_minutes_from)
  - [date::add_seconds_from()](#dateadd_seconds_from)
  - [date::add_days()](#dateadd_days)
  - [date::add_months()](#dateadd_months)
  - [date::add_years()](#dateadd_years)
  - [date::add_weeks()](#dateadd_weeks)
  - [date::add_hours()](#dateadd_hours)
  - [date::add_minutes()](#dateadd_minutes)
  - [date::add_seconds()](#dateadd_seconds)
  - [date::sub_days_from()](#datesub_days_from)
  - [date::sub_months_from()](#datesub_months_from)
  - [date::sub_years_from()](#datesub_years_from)
  - [date::sub_weeks_from()](#datesub_weeks_from)
  - [date::sub_hours_from()](#datesub_hours_from)
  - [date::sub_minutes_from()](#datesub_minutes_from)
  - [date::sub_seconds_from()](#datesub_seconds_from)
  - [date::sub_days()](#datesub_days)
  - [date::sub_months()](#datesub_months)
  - [date::sub_years()](#datesub_years)
  - [date::sub_weeks()](#datesub_weeks)
  - [date::sub_hours()](#datesub_hours)
  - [date::sub_minutes()](#datesub_minutes)
  - [date::sub_seconds()](#datesub_seconds)
  - [date::format()](#dateformat)
- [File](#file)
  - [file::make_temp_file()](#filemake_temp_file)
  - [file::name()](#filename)
  - [file::basename()](#filebasename)
  - [file::extension()](#fileextension)
  - [file::dirname()](#filedirname)
  - [file::full_path()](#filefull_path)
  - [file::mime_type()](#filemime_type)
- [Format](#format)
  - [format::human_readable_seconds()](#formathuman_readable_seconds)
  - [format::bytes_to_human()](#formatbytes_to_human)
- [Interaction](#interaction)
  - [interaction::prompt_yes_no()](#interactionprompt_yes_no)
  - [interaction::prompt_response()](#interactionprompt_response)
- [Miscellaneous](#miscellaneous)
  - [misc::check_internet_connection()](#misccheck_internet_connection)
- [String](#string)
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
- [Variable](#variable)
  - [variable::is_array()](#variableis_array)
  - [variable::is_numeric()](#variableis_numeric)
  - [variable::is_int()](#variableis_int)
  - [variable::is_float()](#variableis_float)
  - [variable::is_bool()](#variableis_bool)
  - [variable::is_true()](#variableis_true)
  - [variable::is_false()](#variableis_false)
- [Inspired By](#inspired-by)
- [License](#license)

<!-- END generate_readme.sh generated TOC please keep comment here to allow auto update -->
## Installation
The script can be installed and sourced using following methods.

### Method 1 - Git Submodules
If the library is used inside a git project then git submodules can be used to install the library to the project.
Following command will initialize git submodule and download the library to `./vendor/bash-utility` folder.

```shell
git submodule init
git submodule add -b master https://github.com/labbots/bash-utility vendor/bash-utility
```

To Update submodules to latest code execute the following command.

```shell
git submodule update --rebase --remote
```

### Method 2 - Git Clone
If you don't want to use git submodules, you can use `git clone` to download library and then move the files to desired location manually.

The below command will clone the repository to `vendor/bash-utility` folder in current working directory.

```shell
git clone https://github.com/labbots/bash-utility.git ./vendor/bash-utility
```
Once the submodule is added or updated, make sure to commit changes to your repository.

```shell
git add .
git commit -m 'Added/updated bash-utility library.'
```
**Note:** When cloning your repository, use `--recurse-submodules` flag to `git clone` command to install the git sub modules.

## Usage
Bash utility functions can be used by simply sourcing the library script file to your own script.
To access all the functions within the bash-utility library, you could import the main bash file as follows.

```shell
source "vendor/bash-utility/bash-utilities.sh"
```

You can also only use the necessary library functions by only importing the required function files. 

```shell
source "vendor/bash-utility/src/array.sh"
```

<!-- START generate_readme.sh generated SHDOC please keep comment here to allow auto update -->
<!-- DO NOT EDIT THIS SECTION, INSTEAD RE-RUN generate_readme.sh TO UPDATE -->
## Array

Functions for array operations and manipulations.

### array::contains()

Check if item exists in the given array.

#### Example

```bash
array=("a" "b" "c")
array::contains "c" ${array[@]}
#Output
0
```

#### Arguments

- **$1** (mixed): Item to search (needle).
- **$2** (array): array to be searched (haystack).

#### Exit codes

- **0**:  If successful.
- **1**: If no match found in the array.
- **2**: Function missing arguments.

### array::dedupe()

Remove duplicate items from the array.

#### Example

```bash
array=("a" "b" "a" "c")
printf "%s" "$(array::dedupe ${array[@]})"
#Output
a b c
```

#### Arguments

- **$1** (array): Array to be deduped.

#### Exit codes

- **0**:  If successful.
- **2**: Function missing arguments.

#### Output on stdout

- Deduplicated array.

### array::is_empty()

Check if a given array is empty.

#### Example

```bash
array=("a" "b" "c" "d")
array::is_empty "${array[@]}"
```

#### Arguments

- **$1** (array): Array to be checked.

#### Exit codes

- **0**: If the given array is empty.
- **2**: If the given array is not empty.

### array::join()

Join array elements with a string.

#### Example

```bash
array=("a" "b" "c" "d")
printf "%s" "$(array::join "," "${array[@]}")"
#Output
a,b,c,d
printf "%s" "$(array::join "" "${array[@]}")"
#Output
abcd
```

#### Arguments

- **$1** (string): String to join the array elements (glue).
- **$2** (array): array to be joined with glue string.

#### Exit codes

- **0**:  If successful.
- **2**: Function missing arguments.

#### Output on stdout

- String containing a string representation of all the array elements in the same order,with the glue string between each element.

### array::reverse()

Return an array with elements in reverse order.

#### Example

```bash
array=(1 2 3 4 5)
printf "%s" "$(array::reverse "${array[@]}")"
#Output
5 4 3 2 1
```

#### Arguments

- **$1** (array): The input array.

#### Exit codes

- **0**:  If successful.
- **2**: Function missing arguments.

#### Output on stdout

- The reversed array.

### array::random_element()

Returns a random item from the array.

#### Example

```bash
array=("a" "b" "c" "d")
printf "%s\n" "$(array::random_element "${array[@]}")"
#Output
c
```

#### Arguments

- **$1** (array): The input array.

#### Exit codes

- **0**:  If successful.
- **2**: Function missing arguments.

#### Output on stdout

- Random item out of the array.

## Check

Helper functions.

### check::command_exists()

Check if the command exists in the system.

#### Example

```bash
check::command_exists "tput"
```

#### Arguments

- **$1** (string): Command name to be searched.

#### Exit codes

- **0**:  If the command exists.
- **1**:  If the command does not exist.
- **2**: Function missing arguments.

### check::is_sudo()

Check if the script is executed with sudo privilege.

#### Example

```bash
check::is_sudo
```

*Function has no arguments.*

#### Exit codes

- **0**:  If the script is executed with root privilege.
- **1**:  If the script is not executed with root privilege

## Date

Functions for manipulating dates.

### date::now()

Get current time in unix timestamp.

#### Example

```bash
echo "$(date::now)"
#Output
1591554426
```

*Function has no arguments.*

#### Exit codes

- **0**:  If successful.
- **1**: If unable to generate timestamp.

#### Output on stdout

- current timestamp.

### date::epoc()

convert datetime string to unix timestamp.

#### Example

```bash
echo "$(date::epoc "2020-07-07 18:38")"
#Output
1594143480
```

#### Arguments

- **$1** (string): date time in any format.

#### Exit codes

- **0**:  If successful.
- **1**: If unable to generate timestamp.
- **2**: Function missing arguments.

#### Output on stdout

- timestamp for specified datetime.

### date::add_days_from()

Add number of days from specified timestamp.
If number of days not specified then it defaults to 1 day.

#### Example

```bash
echo "$(date::add_days_from "1594143480")"
#Output
1594229880
```

#### Arguments

- **$1** (int): unix timestamp.
- **$2** (int): number of days (optional).

#### Exit codes

- **0**:  If successful.
- **1**: If unable to generate timestamp.
- **2**: Function missing arguments.

#### Output on stdout

- timestamp.

### date::add_months_from()

Add number of months from specified timestamp.
If number of months not specified then it defaults to 1 month.

#### Example

```bash
echo "$(date::add_months_from "1594143480")"
#Output
1596821880
```

#### Arguments

- **$1** (int): unix timestamp.
- **$2** (int): number of months (optional).

#### Exit codes

- **0**:  If successful.
- **1**: If unable to generate timestamp.
- **2**: Function missing arguments.

#### Output on stdout

- timestamp.

### date::add_years_from()

Add number of years from specified timestamp.
If number of years not specified then it defaults to 1 year.

#### Example

```bash
echo "$(date::add_years_from "1594143480")"
#Output
1625679480
```

#### Arguments

- **$1** (int): unix timestamp.
- **$2** (int): number of years (optional).

#### Exit codes

- **0**:  If successful.
- **1**: If unable to generate timestamp.
- **2**: Function missing arguments.

#### Output on stdout

- timestamp.

### date::add_weeks_from()

Add number of weeks from specified timestamp.
If number of weeks not specified then it defaults to 1 week.

#### Example

```bash
echo "$(date::add_weeks_from "1594143480")"
#Output
1594748280
```

#### Arguments

- **$1** (int): unix timestamp.
- **$2** (int): number of weeks (optional).

#### Exit codes

- **0**:  If successful.
- **1**: If unable to generate timestamp.
- **2**: Function missing arguments.

#### Output on stdout

- timestamp.

### date::add_hours_from()

Add number of hours from specified timestamp.
If number of hours not specified then it defaults to 1 hour.

#### Example

```bash
echo "$(date::add_hours_from "1594143480")"
#Output
1594147080
```

#### Arguments

- **$1** (int): unix timestamp.
- **$2** (int): number of hours (optional).

#### Exit codes

- **0**:  If successful.
- **1**: If unable to generate timestamp.
- **2**: Function missing arguments.

#### Output on stdout

- timestamp.

### date::add_minutes_from()

Add number of minutes from specified timestamp.
If number of minutes not specified then it defaults to 1 minute.

#### Example

```bash
echo "$(date::add_minutes_from "1594143480")"
#Output
1594143540
```

#### Arguments

- **$1** (int): unix timestamp.
- **$2** (int): number of minutes (optional).

#### Exit codes

- **0**:  If successful.
- **1**: If unable to generate timestamp.
- **2**: Function missing arguments.

#### Output on stdout

- timestamp.

### date::add_seconds_from()

Add number of seconds from specified timestamp.
If number of seconds not specified then it defaults to 1 second.

#### Example

```bash
echo "$(date::add_seconds_from "1594143480")"
#Output
1594143481
```

#### Arguments

- **$1** (int): unix timestamp.
- **$2** (int): number of seconds (optional).

#### Exit codes

- **0**:  If successful.
- **1**: If unable to generate timestamp.
- **2**: Function missing arguments.

#### Output on stdout

- timestamp.

### date::add_days()

Add number of days from current day timestamp.
If number of days not specified then it defaults to 1 day.

#### Example

```bash
echo "$(date::add_days "1")"
#Output
1591640826
```

#### Arguments

- **$1** (int): number of days (optional).

#### Exit codes

- **0**:  If successful.
- **1**: If unable to generate timestamp.

#### Output on stdout

- timestamp.

### date::add_months()

Add number of months from current day timestamp.
If number of months not specified then it defaults to 1 month.

#### Example

```bash
echo "$(date::add_months "1")"
#Output
1594146426
```

#### Arguments

- **$1** (int): number of months (optional).

#### Exit codes

- **0**:  If successful.
- **1**: If unable to generate timestamp.

#### Output on stdout

- timestamp.

### date::add_years()

Add number of years from current day timestamp.
If number of years not specified then it defaults to 1 year.

#### Example

```bash
echo "$(date::add_years "1")"
#Output
1623090426
```

#### Arguments

- **$1** (int): number of years (optional).

#### Exit codes

- **0**:  If successful.
- **1**: If unable to generate timestamp.

#### Output on stdout

- timestamp.

### date::add_weeks()

Add number of weeks from current day timestamp.
If number of weeks not specified then it defaults to 1 year.

#### Example

```bash
echo "$(date::add_weeks "1")"
#Output
1592159226
```

#### Arguments

- **$1** (int): number of weeks (optional).

#### Exit codes

- **0**:  If successful.
- **1**: If unable to generate timestamp.

#### Output on stdout

- timestamp.

### date::add_hours()

Add number of hours from current day timestamp.
If number of hours not specified then it defaults to 1 hour.

#### Example

```bash
echo "$(date::add_hours "1")"
#Output
1591558026
```

#### Arguments

- **$1** (int): number of hours (optional).

#### Exit codes

- **0**:  If successful.
- **1**: If unable to generate timestamp.

#### Output on stdout

- timestamp.

### date::add_minutes()

Add number of minutes from current day timestamp.
If number of minutes not specified then it defaults to 1 minute.

#### Example

```bash
echo "$(date::add_minutes "1")"
#Output
1591554486
```

#### Arguments

- **$2** (int): number of minutes (optional).

#### Exit codes

- **0**:  If successful.
- **1**: If unable to generate timestamp.

#### Output on stdout

- timestamp.

### date::add_seconds()

Add number of seconds from current day timestamp.
If number of seconds not specified then it defaults to 1 second.

#### Example

```bash
echo "$(date::add_seconds "1")"
#Output
1591554427
```

#### Arguments

- **$2** (int): number of seconds (optional).

#### Exit codes

- **0**:  If successful.
- **1**: If unable to generate timestamp.

#### Output on stdout

- timestamp.

### date::sub_days_from()

Subtract number of days from specified timestamp.
If number of days not specified then it defaults to 1 day.

#### Example

```bash
echo "$(date::sub_days_from "1594143480")"
#Output
1594057080
```

#### Arguments

- **$1** (int): unix timestamp.
- **$2** (int): number of days (optional).

#### Exit codes

- **0**:  If successful.
- **1**: If unable to generate timestamp.
- **2**: Function missing arguments.

#### Output on stdout

- timestamp.

### date::sub_months_from()

Subtract number of months from specified timestamp.
If number of months not specified then it defaults to 1 month.

#### Example

```bash
echo "$(date::sub_months_from "1594143480")"
#Output
1591551480
```

#### Arguments

- **$1** (int): unix timestamp.
- **$2** (int): number of months (optional).

#### Exit codes

- **0**:  If successful.
- **1**: If unable to generate timestamp.
- **2**: Function missing arguments.

#### Output on stdout

- timestamp.

### date::sub_years_from()

Subtract number of years from specified timestamp.
If number of years not specified then it defaults to 1 year.

#### Example

```bash
echo "$(date::sub_years_from "1594143480")"
#Output
1562521080
```

#### Arguments

- **$1** (int): unix timestamp.
- **$2** (int): number of years (optional).

#### Exit codes

- **0**:  If successful.
- **1**: If unable to generate timestamp.
- **2**: Function missing arguments.

#### Output on stdout

- timestamp.

### date::sub_weeks_from()

Subtract number of weeks from specified timestamp.
If number of weeks not specified then it defaults to 1 week.

#### Example

```bash
echo "$(date::sub_weeks_from "1594143480")"
#Output
1593538680
```

#### Arguments

- **$1** (int): unix timestamp.
- **$2** (int): number of weeks (optional).

#### Exit codes

- **0**:  If successful.
- **1**: If unable to generate timestamp.
- **2**: Function missing arguments.

#### Output on stdout

- timestamp.

### date::sub_hours_from()

Subtract number of hours from specified timestamp.
If number of hours not specified then it defaults to 1 hour.

#### Example

```bash
echo "$(date::sub_hours_from "1594143480")"
#Output
1594139880
```

#### Arguments

- **$1** (int): unix timestamp.
- **$2** (int): number of hours (optional).

#### Exit codes

- **0**:  If successful.
- **1**: If unable to generate timestamp.
- **2**: Function missing arguments.

#### Output on stdout

- timestamp.

### date::sub_minutes_from()

Subtract number of minutes from specified timestamp.
If number of minutes not specified then it defaults to 1 minute.

#### Example

```bash
echo "$(date::sub_minutes_from "1594143480")"
#Output
1594143420
```

#### Arguments

- **$1** (int): unix timestamp.
- **$2** (int): number of minutes (optional).

#### Exit codes

- **0**:  If successful.
- **1**: If unable to generate timestamp.
- **2**: Function missing arguments.

#### Output on stdout

- timestamp.

### date::sub_seconds_from()

Subtract number of seconds from specified timestamp.
If number of seconds not specified then it defaults to 1 second.

#### Example

```bash
echo "$(date::sub_seconds_from "1594143480")"
#Output
1594143479
```

#### Arguments

- **$1** (int): unix timestamp.
- **$2** (int): number of seconds (optional).

#### Exit codes

- **0**:  If successful.
- **1**: If unable to generate timestamp.
- **2**: Function missing arguments.

#### Output on stdout

- timestamp.

### date::sub_days()

Subtract number of days from current day timestamp.
If number of days not specified then it defaults to 1 day.

#### Example

```bash
echo "$(date::sub_days "1")"
#Output
1588876026
```

#### Arguments

- **$1** (int): number of days (optional).

#### Exit codes

- **0**:  If successful.
- **1**: If unable to generate timestamp.

#### Output on stdout

- timestamp.

### date::sub_months()

Subtract number of months from current day timestamp.
If number of months not specified then it defaults to 1 month.

#### Example

```bash
echo "$(date::sub_months "1")"
#Output
1559932026
```

#### Arguments

- **$1** (int): number of months (optional).

#### Exit codes

- **0**:  If successful.
- **1**: If unable to generate timestamp.

#### Output on stdout

- timestamp.

### date::sub_years()

Subtract number of years from current day timestamp.
If number of years not specified then it defaults to 1 year.

#### Example

```bash
echo "$(date::sub_years "1")"
#Output
1591468026
```

#### Arguments

- **$1** (int): number of years (optional).

#### Exit codes

- **0**:  If successful.
- **1**: If unable to generate timestamp.

#### Output on stdout

- timestamp.

### date::sub_weeks()

Subtract number of weeks from current day timestamp.
If number of weeks not specified then it defaults to 1 week.

#### Example

```bash
echo "$(date::sub_weeks "1")"
#Output
1590949626
```

#### Arguments

- **$1** (int): number of weeks (optional).

#### Exit codes

- **0**:  If successful.
- **1**: If unable to generate timestamp.

#### Output on stdout

- timestamp.

### date::sub_hours()

Subtract number of hours from current day timestamp.
If number of hours not specified then it defaults to 1 hour.

#### Example

```bash
echo "$(date::sub_hours "1")"
#Output
1591550826
```

#### Arguments

- **$1** (int): number of hours (optional).

#### Exit codes

- **0**:  If successful.
- **1**: If unable to generate timestamp.

#### Output on stdout

- timestamp.

### date::sub_minutes()

Subtract number of minutes from current day timestamp.
If number of minutes not specified then it defaults to 1 minute.

#### Example

```bash
echo "$(date::sub_minutes "1")"
#Output
1591554366
```

#### Arguments

- **$1** (int): number of minutes (optional).

#### Exit codes

- **0**:  If successful.
- **1**: If unable to generate timestamp.

#### Output on stdout

- timestamp.

### date::sub_seconds()

Subtract number of seconds from current day timestamp.
If number of seconds not specified then it defaults to 1 second.

#### Example

```bash
echo "$(date::sub_seconds "1")"
#Output
1591554425
```

#### Arguments

- **$1** (int): number of seconds (optional).

#### Exit codes

- **0**:  If successful.
- **1**: If unable to generate timestamp.

#### Output on stdout

- timestamp.

### date::format()

Format unix timestamp to human readable format.
If format string is not specified then it defaults to "yyyy-mm-dd hh:mm:ss" format.

#### Example

```bash
echo echo "$(date::format "1594143480")"
#Output
2020-07-07 18:38:00
```

#### Arguments

- **$1** (int): unix timestamp.
- **$2** (string): format control characters based on `date` command (optional).

#### Exit codes

- **0**:  If successful.
- **1**: If unable to generate time string.
- **2**: Function missing arguments.

#### Output on stdout

- formatted time string.

## File

Functions for handling files.

### file::make_temp_file()

Create temporary file.
Function creates temporary file with random name. The temporary file will be deleted when script finishes.

#### Example

```bash
echo "$(file::make_temp_file)"
#Output
tmp.vgftzy
```

*Function has no arguments.*

#### Exit codes

- **0**:  If successful.
- **1**: If failed to create temp file.

#### Output on stdout

- file name of temporary file created.

### file::name()

Get only the filename from string path.

#### Example

```bash
echo "$(file::name "/path/to/test.md")"
#Output
test.md
```

#### Arguments

- **$1** (string): path.

#### Exit codes

- **0**:  If successful.
- **2**: Function missing arguments.

#### Output on stdout

- name of the file with extension.

### file::basename()

Get the basename of file from file name.

#### Example

```bash
echo "$(file::basename "/path/to/test.md")"
#Output
test
```

#### Arguments

- **$1** (string): path.

#### Exit codes

- **0**:  If successful.
- **2**: Function missing arguments.

#### Output on stdout

- basename of the file.

### file::extension()

Get the extension of file from file name.

#### Example

```bash
echo "$(file::extension "/path/to/test.md")"
#Output
md
```

#### Arguments

- **$1** (string): path.

#### Exit codes

- **0**:  If successful.
- **1**: If no extension is found in the filename.
- **2**: Function missing arguments.

#### Output on stdout

- extension of the file.

### file::dirname()

Get directory name from file path.

#### Example

```bash
echo "$(file::dirname "/path/to/test.md")"
#Output
/path/to
```

#### Arguments

- **$1** (string): path.

#### Exit codes

- **0**:  If successful.
- **2**: Function missing arguments.

#### Output on stdout

- directory path.

### file::full_path()

Get absolute path of file or directory.

#### Example

```bash
file::full_path "../path/to/file.md"
#Output
/home/labbots/docs/path/to/file.md
```

#### Arguments

- **$1** (string): relative or absolute path to file/direcotry.

#### Exit codes

- **0**:  If successful.
- **1**:  If file/directory does not exist.
- **2**: Function missing arguments.

#### Output on stdout

- Absolute path to file/directory.

### file::mime_type()

Get mime type of provided input.

#### Example

```bash
file::mime_type "../src/file.sh"
#Output
application/x-shellscript
```

#### Arguments

- **$1** (string): relative or absolute path to file/direcotry.

#### Exit codes

- **0**:  If successful.
- **1**:  If file/directory does not exist.
- **2**: Function missing arguments.
- **3**: If file or mimetype command not found in system.

#### Output on stdout

- mime type of file/directory.

## Format

Functions to format provided input.

### format::human_readable_seconds()

Format seconds to human readable format.

#### Example

```bash
echo "$(format::human_readable_seconds "356786")"
#Output
4 days 3 hours 6 minute(s) and 26 seconds
```

#### Arguments

- **$1** (int): number of seconds.

#### Exit codes

- **0**:  If successful.
- **2**: Function missing arguments.

#### Output on stdout

- formatted time string.

### format::bytes_to_human()

Format bytes to human readable format.

#### Example

```bash
echo "$(format::bytes_to_human "2250")"
#Output
2.19 KB
```

#### Arguments

- **$1** (int): size in bytes.

#### Exit codes

- **0**:  If successful.
- **2**: Function missing arguments.

#### Output on stdout

- formatted file size string.

## Interaction

Functions to enable interaction with the user.

### interaction::prompt_yes_no()

Prompt yes or no question to the user.

#### Example

```bash
interaction::prompt_yes_no "Are you sure to proceed" "yes"
#Output
Are you sure to proceed (y/n)? [y]
```

#### Arguments

- **$1** (string): The question to be prompted to the user.
- **$2** (string): default answer \[yes/no\] (optional).

#### Exit codes

- **0**:  If user responds with yes.
- **1**:  If user responds with no.
- **2**: Function missing arguments.

#### Output on stdout

- question to be prompted to the user.

### interaction::prompt_response()

Prompt question to the user.

#### Example

```bash
interaction::prompt_response "Choose directory to install" "/home/path"
#Output
Choose directory to install? [/home/path]
```

#### Arguments

- **$1** (string): The question to be prompted to the user.
- **$2** (string): default answer (optional).

#### Exit codes

- **0**:  If user responds with answer.
- **2**: Function missing arguments.

#### Output on stdout

- question to be prompted to the user.

## Miscellaneous

Set of miscellaneous helper functions.

### misc::check_internet_connection()

Check if internet connection is available.

#### Example

```bash
misc::check_internet_connection
```

*Function has no arguments.*

#### Exit codes

- **0**:  If script can connect to internet.
- **1**: If script cannot access internet.

## String

Functions for string operations and manipulations.

### string::trim()

Strip whitespace from the beginning and end of a string.

#### Example

```bash
echo "$(string::trim "   Hello World!   ")"
#Output
Hello World!
```

#### Arguments

- **$1** (string): The string to be trimmed.

#### Exit codes

- **0**:  If successful.
- **2**: Function missing arguments.

#### Output on stdout

- The trimmed string.

### string::split()

Split a string to array by a delimiter.

#### Example

```bash
printf "%s" "$(string::split "Hello!World" "!")"
#Output
Hello
World
```

#### Arguments

- **$1** (string): The input string.
- **$2** (string): The delimiter string.

#### Exit codes

- **0**:  If successful.
- **2**: Function missing arguments.

#### Output on stdout

- Returns an array of strings created by splitting the string parameter by the delimiter.

### string::lstrip()

Strip characters from the beginning of a string.

#### Example

```bash
echo "$(string::lstrip "Hello World!" "He")"
#Output
llo World!
```

#### Arguments

- **$1** (string): The input string.
- **$2** (string): The characters you want to strip.

#### Exit codes

- **0**:  If successful.
- **2**: Function missing arguments.

#### Output on stdout

- Returns the modified string.

### string::rstrip()

Strip characters from the end of a string.

#### Example

```bash
echo "$(string::rstrip "Hello World!" "d!")"
#Output
Hello Worl
```

#### Arguments

- **$1** (string): The input string.
- **$2** (string): The characters you want to strip.

#### Exit codes

- **0**:  If successful.
- **2**: Function missing arguments.

#### Output on stdout

- Returns the modified string.

### string::to_lower()

Make a string lowercase.

#### Example

```bash
echo "$(string::to_lower "HellO")"
#Output
hello
```

#### Arguments

- **$1** (string): The input string.

#### Exit codes

- **0**:  If successful.
- **2**: Function missing arguments.

#### Output on stdout

- Returns the lowercased string.

### string::to_upper()

Make a string all uppercase.

#### Example

```bash
echo "$(string::to_upper "HellO")"
#Output
HELLO
```

#### Arguments

- **$1** (string): The input string.

#### Exit codes

- **0**:  If successful.
- **2**: Function missing arguments.

#### Output on stdout

- Returns the uppercased string.

### string::contains()

Check whether the search string exists within the input string.

#### Example

```bash
string::contains "Hello World!" "lo"
```

#### Arguments

- **$1** (string): The input string.
- **$2** (string): The search key.

#### Exit codes

- **0**:  If match found.
- **1**:  If no match found.
- **2**: Function missing arguments.

### string::starts_with()

Check whether the input string starts with key string.

#### Example

```bash
string::starts_with "Hello World!" "He"
```

#### Arguments

- **$1** (string): The input string.
- **$2** (string): The search key.

#### Exit codes

- **0**:  If match found.
- **1**:  If no match found.
- **2**: Function missing arguments.

### string::ends_with()

Check whether the input string ends with key string.

#### Example

```bash
string::ends_with "Hello World!" "d!"
```

#### Arguments

- **$1** (string): The input string.
- **$2** (string): The search key.

#### Exit codes

- **0**:  If match found.
- **1**:  If no match found.
- **2**: Function missing arguments.

### string::regex()

Check whether the input string matches the given regex.

#### Example

```bash
string::regex "HELLO" "^[A-Z]*$"
```

#### Arguments

- **$1** (string): The input string.
- **$2** (string): The search key.

#### Exit codes

- **0**:  If match found.
- **1**:  If no match found.
- **2**: Function missing arguments.

## Variable

Functions for handling variables.

### variable::is_array()

Check if given variable is array.
Pass the variable name instead of value of the variable.

#### Example

```bash
arr=("a" "b" "c")
variable::is_array "arr"
#Output
0
```

#### Arguments

- **$1** (string): name of the variable to check.

#### Exit codes

- **0**:  If input is array.
- **1**: If input is not an array.

### variable::is_numeric()

Check if given variable is a number.

#### Example

```bash
variable::is_numeric "1234"
#Output
0
```

#### Arguments

- **$1** (mixed): Value of variable to check.

#### Exit codes

- **0**:  If input is number.
- **1**: If input is not a number.

### variable::is_int()

Check if given variable is an integer.

#### Example

```bash
variable::is_int "+1234"
#Output
0
```

#### Arguments

- **$1** (mixed): Value of variable to check.

#### Exit codes

- **0**:  If input is an integer.
- **1**: If input is not an integer.

### variable::is_float()

Check if given variable is a float.

#### Example

```bash
variable::is_float "+1234.0"
#Output
0
```

#### Arguments

- **$1** (mixed): Value of variable to check.

#### Exit codes

- **0**:  If input is a float.
- **1**: If input is not a float.

### variable::is_bool()

Check if given variable is a boolean.

#### Example

```bash
variable::is_bool "true"
#Output
0
```

#### Arguments

- **$1** (mixed): Value of variable to check.

#### Exit codes

- **0**:  If input is a boolean.
- **1**: If input is not a boolean.

### variable::is_true()

Check if given variable is a true.

#### Example

```bash
variable::is_true "true"
#Output
0
```

#### Arguments

- **$1** (mixed): Value of variable to check.

#### Exit codes

- **0**:  If input is true.
- **1**: If input is not true.

### variable::is_false()

Check if given variable is false.

#### Example

```bash
variable::is_false "false"
#Output
0
```

#### Arguments

- **$1** (mixed): Value of variable to check.

#### Exit codes

- **0**:  If input is false.
- **1**: If input is not false.

<!-- END generate_readme.sh generated SHDOC please keep comment here to allow auto update -->

## Inspired By

- [Bash Bible](https://github.com/dylanaraps/pure-bash-bible) - A collection of pure bash alternatives to external processes.
  
## License

[MIT](https://github.com/labbots/google-drive-upload/blob/master/LICENSE)
