<h1 align="center">Bash Utility</h1>

<p align="center">
<a href="https://github.com/labbots/bash-utility/stargazers"><img src="https://img.shields.io/github/stars/labbots/bash-utility.svg?color=blueviolet&style=for-the-badge" alt="Stars"></a>
<a href="https://github.com/labbots/bash-utility/blob/master/LICENSE"><img src="https://img.shields.io/github/license/labbots/bash-utility.svg?style=for-the-badge" alt="License"></a>
<a href="https://www.codacy.com/manual/labbots/bash-utility?utm_source=github.com&amp;utm_medium=referral&amp;utm_content=labbots/bash-utility&amp;utm_campaign=Badge_Grade"><img src="https://img.shields.io/codacy/grade/99fbe8d389254b6ebb37899ce89658e3?style=for-the-badge"/></a>
</p>
<p align="center">
<a href="https://github.com/labbots/bash-utility/actions?query=workflow%3A%22github+pages%22"><img alt="Gh-pages Status" src="https://img.shields.io/github/workflow/status/labbots/bash-utility/github%20pages/hugo-docs?label=Gh%20pages&style=for-the-badge"></a>
<a href="https://labbots.github.io/bash-utility/"><img alt="Website" src="https://img.shields.io/website?down_color=red&style=for-the-badge&up_color=success&url=https%3A%2F%2Flabbots.github.io%2Fbash-utility%2F"></a>
</p>
<p align="center">
<img alt="Total number of Library functions" src="https://img.shields.io/static/v1?label=Library%20Functions&message=107&color=blue&style=for-the-badge">
</p>
<p align="center">
<img src="image/bash-utility.png" height="250"/>
</p>
Bash library which provides utility functions and helpers for functional programming in Bash.

Detailed documentation is available at <https://labbots.github.io/bash-utility/>

<!-- START generate_readme.sh generated TOC please keep comment here to allow auto update -->
<!-- DO NOT EDIT THIS SECTION, INSTEAD RE-RUN generate_readme.sh TO UPDATE -->
## Table of Contents

- [Installation](#installation)
  - [Method 1 - Git Submodules](#method-1---git-submodules)
  - [Method 2 - Git Clone](#method-2---git-clone)
  - [Method 3 - Direct Download](#method-3---direct-download)
- [Usage](#usage)
- [Array](#array)
  - [array::contains()](#arraycontains)
  - [array::dedupe()](#arraydedupe)
  - [array::is_empty()](#arrayis_empty)
  - [array::join()](#arrayjoin)
  - [array::reverse()](#arrayreverse)
  - [array::random_element()](#arrayrandom_element)
  - [array::sort()](#arraysort)
  - [array::rsort()](#arrayrsort)
  - [array::bsort()](#arraybsort)
  - [array::merge()](#arraymerge)
- [Check](#check)
  - [check::command_exists()](#checkcommand_exists)
  - [check::is_sudo()](#checkis_sudo)
- [Collection](#collection)
  - [collection::each()](#collectioneach)
  - [collection::every()](#collectionevery)
  - [collection::filter()](#collectionfilter)
  - [collection::find()](#collectionfind)
  - [collection::invoke()](#collectioninvoke)
  - [collection::map()](#collectionmap)
  - [collection::reject()](#collectionreject)
  - [collection::some()](#collectionsome)
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
- [Debug](#debug)
  - [debug::print_array()](#debugprint_array)
  - [debug::print_ansi()](#debugprint_ansi)
- [File](#file)
  - [file::make_temp_file()](#filemake_temp_file)
  - [file::make_temp_dir()](#filemake_temp_dir)
  - [file::name()](#filename)
  - [file::basename()](#filebasename)
  - [file::extension()](#fileextension)
  - [file::dirname()](#filedirname)
  - [file::full_path()](#filefull_path)
  - [file::mime_type()](#filemime_type)
  - [file::contains_text()](#filecontains_text)
- [Format](#format)
  - [format::human_readable_seconds()](#formathuman_readable_seconds)
  - [format::bytes_to_human()](#formatbytes_to_human)
  - [format::strip_ansi()](#formatstrip_ansi)
  - [format::text_center()](#formattext_center)
  - [format::report()](#formatreport)
  - [format::trim_text_to_term()](#formattrim_text_to_term)
- [Interaction](#interaction)
  - [interaction::prompt_yes_no()](#interactionprompt_yes_no)
  - [interaction::prompt_response()](#interactionprompt_response)
- [Json](#json)
  - [json::get_value()](#jsonget_value)
- [Miscellaneous](#miscellaneous)
  - [misc::check_internet_connection()](#misccheck_internet_connection)
  - [misc::get_pid()](#miscget_pid)
  - [misc::get_uid()](#miscget_uid)
  - [misc::generate_uuid()](#miscgenerate_uuid)
- [Operating System](#operating-system)
  - [os::detect_os()](#osdetect_os)
  - [os::detect_linux_distro()](#osdetect_linux_distro)
  - [os::detect_linux_version()](#osdetect_linux_version)
  - [os::detect_mac_version()](#osdetect_mac_version)
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
- [Terminal](#terminal)
  - [terminal::is_term()](#terminalis_term)
  - [terminal::detect_profile()](#terminaldetect_profile)
  - [terminal::clear_line()](#terminalclear_line)
- [Validation](#validation)
  - [validation::email()](#validationemail)
  - [validation::ipv4()](#validationipv4)
  - [validation::ipv6()](#validationipv6)
  - [validation::alpha()](#validationalpha)
  - [validation::alpha_num()](#validationalpha_num)
  - [validation::alpha_dash()](#validationalpha_dash)
  - [validation::version_comparison()](#validationversion_comparison)
- [Variable](#variable)
  - [variable::is_array()](#variableis_array)
  - [variable::is_numeric()](#variableis_numeric)
  - [variable::is_int()](#variableis_int)
  - [variable::is_float()](#variableis_float)
  - [variable::is_bool()](#variableis_bool)
  - [variable::is_true()](#variableis_true)
  - [variable::is_false()](#variableis_false)
  - [variable::is_empty_or_null()](#variableis_empty_or_null)
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
Once the submodule is added or updated, make sure to commit changes to your repository.

```shell
git add .
git commit -m 'Added/updated bash-utility library.'
```
**Note:** When cloning your repository, use `--recurse-submodules` flag to `git clone` command to install the git sub modules.

### Method 2 - Git Clone
If you don't want to use git submodules, you can use `git clone` to download library and then move the files to desired location manually.

The below command will clone the repository to `vendor/bash-utility` folder in current working directory.

```shell
git clone https://github.com/labbots/bash-utility.git ./vendor/bash-utility
```
### Method 3 - Direct Download
If you do not have git installed, you can download the archive of the latest version of the library. Extract the zip file to appropriate folder by following the below command.

```shell
wget https://github.com/labbots/bash-utility/archive/master.zip
unzip -q master.zip -d tmp
mkdir -p vendor/bash-utility
mv tmp/bash-utility-master vendor/bash-utility
rm tmp
```

## Usage
Bash utility functions can be used by simply sourcing the library script file to your own script.
To access all the functions within the bash-utility library, you could import the main bash file as follows.

```shell
source "vendor/bash-utility/bash-utility.sh"
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

#### Arguments

- **$1** (mixed): Item to search (needle).
- **$2** (array): array to be searched (haystack).

#### Exit codes

- **0**:  If successful.
- **1**: If no match found in the array.
- **2**: Function missing arguments.

#### Example

```bash
array=("a" "b" "c")
array::contains "c" ${array[@]}
#Output
0
```

### array::dedupe()

Remove duplicate items from the array.

#### Arguments

- **$1** (array): Array to be deduped.

#### Exit codes

- **0**:  If successful.
- **2**: Function missing arguments.

#### Output on stdout

- Deduplicated array.

#### Example

```bash
array=("a" "b" "a" "c")
printf "%s" "$(array::dedupe ${array[@]})"
#Output
a
b
c
```

### array::is_empty()

Check if a given array is empty.

#### Arguments

- **$1** (array): Array to be checked.

#### Exit codes

- **0**: If the given array is empty.
- **2**: If the given array is not empty.

#### Example

```bash
array=("a" "b" "c" "d")
array::is_empty "${array[@]}"
```

### array::join()

Join array elements with a string.

#### Arguments

- **$1** (string): String to join the array elements (glue).
- **$2** (array): array to be joined with glue string.

#### Exit codes

- **0**:  If successful.
- **2**: Function missing arguments.

#### Output on stdout

- String containing a string representation of all the array elements in the same order,with the glue string between each element.

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

### array::reverse()

Return an array with elements in reverse order.

#### Arguments

- **$1** (array): The input array.

#### Exit codes

- **0**:  If successful.
- **2**: Function missing arguments.

#### Output on stdout

- The reversed array.

#### Example

```bash
array=(1 2 3 4 5)
printf "%s" "$(array::reverse "${array[@]}")"
#Output
5 4 3 2 1
```

### array::random_element()

Returns a random item from the array.

#### Arguments

- **$1** (array): The input array.

#### Exit codes

- **0**:  If successful.
- **2**: Function missing arguments.

#### Output on stdout

- Random item out of the array.

#### Example

```bash
array=("a" "b" "c" "d")
printf "%s\n" "$(array::random_element "${array[@]}")"
#Output
c
```

### array::sort()

Sort an array from lowest to highest.

#### Arguments

- **$1** (array): The input array.

#### Exit codes

- **0**:  If successful.
- **2**: Function missing arguments.

#### Output on stdout

- sorted array.

#### Example

```bash
sarr=("a c" "a" "d" 2 1 "4 5")
array::array_sort "${sarr[@]}"
#Output
1
2
4 5
a
a c
d
```

### array::rsort()

Sort an array in reverse order (highest to lowest).

#### Arguments

- **$1** (array): The input array.

#### Exit codes

- **0**:  If successful.
- **2**: Function missing arguments.

#### Output on stdout

- reverse sorted array.

#### Example

```bash
sarr=("a c" "a" "d" 2 1 "4 5")
array::array_sort "${sarr[@]}"
#Output
d
a c
a
4 5
2
1
```

### array::bsort()

Bubble sort an integer array from lowest to highest.
This sort does not work on string array.

#### Arguments

- **$1** (array): The input array.

#### Exit codes

- **0**:  If successful.
- **2**: Function missing arguments.

#### Output on stdout

- bubble sorted array.

#### Example

```bash
iarr=(4 5 1 3)
array::bsort "${iarr[@]}"
#Output
1
3
4
5
```

### array::merge()

Merge two arrays.
Pass the variable name of the array instead of value of the variable.

#### Arguments

- **$1** (string): variable name of first array.
- **$2** (string): variable name of second array.

#### Exit codes

- **0**:  If successful.
- **2**: Function missing arguments.

#### Output on stdout

- Merged array.

#### Example

```bash
a=("a" "c")
b=("d" "c")
array::merge "a[@]" "b[@]"
#Output
a
c
d
c
```

## Check

Helper functions.

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

## Collection

(Experimental) Functions to iterates over a list of elements, yielding each in turn to an iteratee function.

### collection::each()

Iterates over elements of collection and invokes iteratee for each element.
Input to the function can be a pipe output, here-string or file.

#### Arguments

- **$1** (string): Iteratee function.

#### Exit codes

- **0**:  If successful.
- **2**: Function missing arguments.
- other exitcode returned by iteratee.

#### Output on stdout

- Output of iteratee function.

#### Example

```bash
test_func(){
   printf "print value: %s\n" "$1"
   return 0
 }
arr1=("a b" "c d" "a" "d")
printf "%s\n" "${arr1[@]}" | collection::each "test_func"
collection::each "test_func"  < <(printf "%s\n" "${arr1[@]}") #alternative approach
#output
 print value: a b
 print value: c d
 print value: a
 print value: d
```

#### Example

```bash
# If other function from this library is already used to process the array.
# Then following method could be used to pass the array to the function.
out=("$(array::dedupe "${arr1[@]}")")
collection::each "test_func"  <<< "${out[@]}"
```

### collection::every()

Checks if iteratee function returns truthy for all elements of collection. Iteration is stopped once predicate returns false.
Input to the function can be a pipe output, here-string or file.

#### Arguments

- **$1** (string): Iteratee function.

#### Exit codes

- **0**:  If successful.
- **1**: If iteratee function fails.
- **2**: Function missing arguments.

#### Example

```bash
arri=("1" "2" "3" "4")
printf "%s\n" "${arri[@]}" | collection::every "variable::is_numeric"
```

### collection::filter()

Iterates over elements of array, returning all elements where iteratee returns true.
Input to the function can be a pipe output, here-string or file.

#### Arguments

- **$1** (string): Iteratee function.

#### Exit codes

- **0**:  If successful.
- **2**: Function missing arguments.

#### Output on stdout

- array values matching the iteratee function.

#### Example

```bash
arri=("1" "2" "3" "a")
printf "%s\n" "${arri[@]}" | collection::filter "variable::is_numeric"
#output
1
2
3
```

### collection::find()

Iterates over elements of collection, returning the first element where iteratee returns true.
Input to the function can be a pipe output, here-string or file.

#### Arguments

- **$1** (string): Iteratee function.

#### Exit codes

- **0**:  If successful.
- **1**: If no match found.
- **2**: Function missing arguments.

#### Output on stdout

- first array value matching the iteratee function.

#### Example

```bash
arr=("1" "2" "3" "a")
check_a(){
    [[ "$1" = "a" ]]
}
printf "%s\n" "${arr[@]}" | collection::find "check_a"
#Output
a
```

### collection::invoke()

Invokes the iteratee with each element passed as argument to the iteratee.
Input to the function can be a pipe output, here-string or file.

#### Arguments

- **$1** (string): Iteratee function.

#### Exit codes

- **0**:  If successful.
- **2**: Function missing arguments.
- other exitcode returned by iteratee.

#### Output on stdout

- Output from the iteratee function.

#### Example

```bash
opt=("-a" "-l")
printf "%s\n" "${opt[@]}" | collection::invoke "ls"
```

### collection::map()

Creates an array of values by running each element in array through iteratee.
Input to the function can be a pipe output, here-string or file.

#### Arguments

- **$1** (string): Iteratee function.

#### Exit codes

- **0**:  If successful.
- **2**: Function missing arguments.
- other exitcode returned by iteratee.

#### Output on stdout

- Output result of iteratee on value.

#### Example

```bash
arri=("1" "2" "3")
add_one(){
  i=${1}
  i=$(( i + 1 ))
  printf "%s\n" "$i"
}
printf "%s\n" "${arri[@]}" | collection::map "add_one"
```

### collection::reject()

The opposite of filter function; this method returns the elements of collection that iteratee does not return true.
Input to the function can be a pipe output, here-string or file.

#### Arguments

- **$1** (string): Iteratee function.

#### Exit codes

- **0**:  If successful.
- **2**: Function missing arguments.

#### Output on stdout

- array values not matching the iteratee function.

#### Example

```bash
arri=("1" "2" "3" "a")
printf "%s\n" "${arri[@]}" | collection::reject "variable::is_numeric"
#Ouput
a
```

#### See also

- [collection::filter](#collectionfilter)

### collection::some()

Checks if iteratee returns true for any element of the array.
Input to the function can be a pipe output, here-string or file.

#### Arguments

- **$1** (string): Iteratee function.

#### Exit codes

- **0**:  If match successful.
- **1**: If no match found.
- **2**: Function missing arguments.

#### Example

```bash
arr=("a" "b" "3" "a")
printf "%s\n" "${arr[@]}" | collection::reject "variable::is_numeric"
```

## Date

Functions for manipulating dates.

### date::now()

Get current time in unix timestamp.

*Function has no arguments.*

#### Exit codes

- **0**:  If successful.
- **1**: If unable to generate timestamp.

#### Output on stdout

- current timestamp.

#### Example

```bash
echo "$(date::now)"
#Output
1591554426
```

### date::epoc()

convert datetime string to unix timestamp.

#### Arguments

- **$1** (string): date time in any format.

#### Exit codes

- **0**:  If successful.
- **1**: If unable to generate timestamp.
- **2**: Function missing arguments.

#### Output on stdout

- timestamp for specified datetime.

#### Example

```bash
echo "$(date::epoc "2020-07-07 18:38")"
#Output
1594143480
```

### date::add_days_from()

Add number of days from specified timestamp.
If number of days not specified then it defaults to 1 day.

#### Arguments

- **$1** (int): unix timestamp.
- **$2** (int): number of days (optional).

#### Exit codes

- **0**:  If successful.
- **1**: If unable to generate timestamp.
- **2**: Function missing arguments.

#### Output on stdout

- timestamp.

#### Example

```bash
echo "$(date::add_days_from "1594143480")"
#Output
1594229880
```

### date::add_months_from()

Add number of months from specified timestamp.
If number of months not specified then it defaults to 1 month.

#### Arguments

- **$1** (int): unix timestamp.
- **$2** (int): number of months (optional).

#### Exit codes

- **0**:  If successful.
- **1**: If unable to generate timestamp.
- **2**: Function missing arguments.

#### Output on stdout

- timestamp.

#### Example

```bash
echo "$(date::add_months_from "1594143480")"
#Output
1596821880
```

### date::add_years_from()

Add number of years from specified timestamp.
If number of years not specified then it defaults to 1 year.

#### Arguments

- **$1** (int): unix timestamp.
- **$2** (int): number of years (optional).

#### Exit codes

- **0**:  If successful.
- **1**: If unable to generate timestamp.
- **2**: Function missing arguments.

#### Output on stdout

- timestamp.

#### Example

```bash
echo "$(date::add_years_from "1594143480")"
#Output
1625679480
```

### date::add_weeks_from()

Add number of weeks from specified timestamp.
If number of weeks not specified then it defaults to 1 week.

#### Arguments

- **$1** (int): unix timestamp.
- **$2** (int): number of weeks (optional).

#### Exit codes

- **0**:  If successful.
- **1**: If unable to generate timestamp.
- **2**: Function missing arguments.

#### Output on stdout

- timestamp.

#### Example

```bash
echo "$(date::add_weeks_from "1594143480")"
#Output
1594748280
```

### date::add_hours_from()

Add number of hours from specified timestamp.
If number of hours not specified then it defaults to 1 hour.

#### Arguments

- **$1** (int): unix timestamp.
- **$2** (int): number of hours (optional).

#### Exit codes

- **0**:  If successful.
- **1**: If unable to generate timestamp.
- **2**: Function missing arguments.

#### Output on stdout

- timestamp.

#### Example

```bash
echo "$(date::add_hours_from "1594143480")"
#Output
1594147080
```

### date::add_minutes_from()

Add number of minutes from specified timestamp.
If number of minutes not specified then it defaults to 1 minute.

#### Arguments

- **$1** (int): unix timestamp.
- **$2** (int): number of minutes (optional).

#### Exit codes

- **0**:  If successful.
- **1**: If unable to generate timestamp.
- **2**: Function missing arguments.

#### Output on stdout

- timestamp.

#### Example

```bash
echo "$(date::add_minutes_from "1594143480")"
#Output
1594143540
```

### date::add_seconds_from()

Add number of seconds from specified timestamp.
If number of seconds not specified then it defaults to 1 second.

#### Arguments

- **$1** (int): unix timestamp.
- **$2** (int): number of seconds (optional).

#### Exit codes

- **0**:  If successful.
- **1**: If unable to generate timestamp.
- **2**: Function missing arguments.

#### Output on stdout

- timestamp.

#### Example

```bash
echo "$(date::add_seconds_from "1594143480")"
#Output
1594143481
```

### date::add_days()

Add number of days from current day timestamp.
If number of days not specified then it defaults to 1 day.

#### Arguments

- **$1** (int): number of days (optional).

#### Exit codes

- **0**:  If successful.
- **1**: If unable to generate timestamp.

#### Output on stdout

- timestamp.

#### Example

```bash
echo "$(date::add_days "1")"
#Output
1591640826
```

### date::add_months()

Add number of months from current day timestamp.
If number of months not specified then it defaults to 1 month.

#### Arguments

- **$1** (int): number of months (optional).

#### Exit codes

- **0**:  If successful.
- **1**: If unable to generate timestamp.

#### Output on stdout

- timestamp.

#### Example

```bash
echo "$(date::add_months "1")"
#Output
1594146426
```

### date::add_years()

Add number of years from current day timestamp.
If number of years not specified then it defaults to 1 year.

#### Arguments

- **$1** (int): number of years (optional).

#### Exit codes

- **0**:  If successful.
- **1**: If unable to generate timestamp.

#### Output on stdout

- timestamp.

#### Example

```bash
echo "$(date::add_years "1")"
#Output
1623090426
```

### date::add_weeks()

Add number of weeks from current day timestamp.
If number of weeks not specified then it defaults to 1 year.

#### Arguments

- **$1** (int): number of weeks (optional).

#### Exit codes

- **0**:  If successful.
- **1**: If unable to generate timestamp.

#### Output on stdout

- timestamp.

#### Example

```bash
echo "$(date::add_weeks "1")"
#Output
1592159226
```

### date::add_hours()

Add number of hours from current day timestamp.
If number of hours not specified then it defaults to 1 hour.

#### Arguments

- **$1** (int): number of hours (optional).

#### Exit codes

- **0**:  If successful.
- **1**: If unable to generate timestamp.

#### Output on stdout

- timestamp.

#### Example

```bash
echo "$(date::add_hours "1")"
#Output
1591558026
```

### date::add_minutes()

Add number of minutes from current day timestamp.
If number of minutes not specified then it defaults to 1 minute.

#### Arguments

- **$2** (int): number of minutes (optional).

#### Exit codes

- **0**:  If successful.
- **1**: If unable to generate timestamp.

#### Output on stdout

- timestamp.

#### Example

```bash
echo "$(date::add_minutes "1")"
#Output
1591554486
```

### date::add_seconds()

Add number of seconds from current day timestamp.
If number of seconds not specified then it defaults to 1 second.

#### Arguments

- **$2** (int): number of seconds (optional).

#### Exit codes

- **0**:  If successful.
- **1**: If unable to generate timestamp.

#### Output on stdout

- timestamp.

#### Example

```bash
echo "$(date::add_seconds "1")"
#Output
1591554427
```

### date::sub_days_from()

Subtract number of days from specified timestamp.
If number of days not specified then it defaults to 1 day.

#### Arguments

- **$1** (int): unix timestamp.
- **$2** (int): number of days (optional).

#### Exit codes

- **0**:  If successful.
- **1**: If unable to generate timestamp.
- **2**: Function missing arguments.

#### Output on stdout

- timestamp.

#### Example

```bash
echo "$(date::sub_days_from "1594143480")"
#Output
1594057080
```

### date::sub_months_from()

Subtract number of months from specified timestamp.
If number of months not specified then it defaults to 1 month.

#### Arguments

- **$1** (int): unix timestamp.
- **$2** (int): number of months (optional).

#### Exit codes

- **0**:  If successful.
- **1**: If unable to generate timestamp.
- **2**: Function missing arguments.

#### Output on stdout

- timestamp.

#### Example

```bash
echo "$(date::sub_months_from "1594143480")"
#Output
1591551480
```

### date::sub_years_from()

Subtract number of years from specified timestamp.
If number of years not specified then it defaults to 1 year.

#### Arguments

- **$1** (int): unix timestamp.
- **$2** (int): number of years (optional).

#### Exit codes

- **0**:  If successful.
- **1**: If unable to generate timestamp.
- **2**: Function missing arguments.

#### Output on stdout

- timestamp.

#### Example

```bash
echo "$(date::sub_years_from "1594143480")"
#Output
1562521080
```

### date::sub_weeks_from()

Subtract number of weeks from specified timestamp.
If number of weeks not specified then it defaults to 1 week.

#### Arguments

- **$1** (int): unix timestamp.
- **$2** (int): number of weeks (optional).

#### Exit codes

- **0**:  If successful.
- **1**: If unable to generate timestamp.
- **2**: Function missing arguments.

#### Output on stdout

- timestamp.

#### Example

```bash
echo "$(date::sub_weeks_from "1594143480")"
#Output
1593538680
```

### date::sub_hours_from()

Subtract number of hours from specified timestamp.
If number of hours not specified then it defaults to 1 hour.

#### Arguments

- **$1** (int): unix timestamp.
- **$2** (int): number of hours (optional).

#### Exit codes

- **0**:  If successful.
- **1**: If unable to generate timestamp.
- **2**: Function missing arguments.

#### Output on stdout

- timestamp.

#### Example

```bash
echo "$(date::sub_hours_from "1594143480")"
#Output
1594139880
```

### date::sub_minutes_from()

Subtract number of minutes from specified timestamp.
If number of minutes not specified then it defaults to 1 minute.

#### Arguments

- **$1** (int): unix timestamp.
- **$2** (int): number of minutes (optional).

#### Exit codes

- **0**:  If successful.
- **1**: If unable to generate timestamp.
- **2**: Function missing arguments.

#### Output on stdout

- timestamp.

#### Example

```bash
echo "$(date::sub_minutes_from "1594143480")"
#Output
1594143420
```

### date::sub_seconds_from()

Subtract number of seconds from specified timestamp.
If number of seconds not specified then it defaults to 1 second.

#### Arguments

- **$1** (int): unix timestamp.
- **$2** (int): number of seconds (optional).

#### Exit codes

- **0**:  If successful.
- **1**: If unable to generate timestamp.
- **2**: Function missing arguments.

#### Output on stdout

- timestamp.

#### Example

```bash
echo "$(date::sub_seconds_from "1594143480")"
#Output
1594143479
```

### date::sub_days()

Subtract number of days from current day timestamp.
If number of days not specified then it defaults to 1 day.

#### Arguments

- **$1** (int): number of days (optional).

#### Exit codes

- **0**:  If successful.
- **1**: If unable to generate timestamp.

#### Output on stdout

- timestamp.

#### Example

```bash
echo "$(date::sub_days "1")"
#Output
1588876026
```

### date::sub_months()

Subtract number of months from current day timestamp.
If number of months not specified then it defaults to 1 month.

#### Arguments

- **$1** (int): number of months (optional).

#### Exit codes

- **0**:  If successful.
- **1**: If unable to generate timestamp.

#### Output on stdout

- timestamp.

#### Example

```bash
echo "$(date::sub_months "1")"
#Output
1559932026
```

### date::sub_years()

Subtract number of years from current day timestamp.
If number of years not specified then it defaults to 1 year.

#### Arguments

- **$1** (int): number of years (optional).

#### Exit codes

- **0**:  If successful.
- **1**: If unable to generate timestamp.

#### Output on stdout

- timestamp.

#### Example

```bash
echo "$(date::sub_years "1")"
#Output
1591468026
```

### date::sub_weeks()

Subtract number of weeks from current day timestamp.
If number of weeks not specified then it defaults to 1 week.

#### Arguments

- **$1** (int): number of weeks (optional).

#### Exit codes

- **0**:  If successful.
- **1**: If unable to generate timestamp.

#### Output on stdout

- timestamp.

#### Example

```bash
echo "$(date::sub_weeks "1")"
#Output
1590949626
```

### date::sub_hours()

Subtract number of hours from current day timestamp.
If number of hours not specified then it defaults to 1 hour.

#### Arguments

- **$1** (int): number of hours (optional).

#### Exit codes

- **0**:  If successful.
- **1**: If unable to generate timestamp.

#### Output on stdout

- timestamp.

#### Example

```bash
echo "$(date::sub_hours "1")"
#Output
1591550826
```

### date::sub_minutes()

Subtract number of minutes from current day timestamp.
If number of minutes not specified then it defaults to 1 minute.

#### Arguments

- **$1** (int): number of minutes (optional).

#### Exit codes

- **0**:  If successful.
- **1**: If unable to generate timestamp.

#### Output on stdout

- timestamp.

#### Example

```bash
echo "$(date::sub_minutes "1")"
#Output
1591554366
```

### date::sub_seconds()

Subtract number of seconds from current day timestamp.
If number of seconds not specified then it defaults to 1 second.

#### Arguments

- **$1** (int): number of seconds (optional).

#### Exit codes

- **0**:  If successful.
- **1**: If unable to generate timestamp.

#### Output on stdout

- timestamp.

#### Example

```bash
echo "$(date::sub_seconds "1")"
#Output
1591554425
```

### date::format()

Format unix timestamp to human readable format.
If format string is not specified then it defaults to "yyyy-mm-dd hh:mm:ss" format.

#### Arguments

- **$1** (int): unix timestamp.
- **$2** (string): format control characters based on `date` command (optional).

#### Exit codes

- **0**:  If successful.
- **1**: If unable to generate time string.
- **2**: Function missing arguments.

#### Output on stdout

- formatted time string.

#### Example

```bash
echo echo "$(date::format "1594143480")"
#Output
2020-07-07 18:38:00
```

## Debug

Functions to facilitate debugging scripts.

### debug::print_array()

Prints the content of array as key value pair for easier debugging.
Pass the variable name of the array instead of value of the variable.

#### Arguments

- **$1** (string): variable name of the array.

#### Output on stdout

- Formatted key value of array.

#### Example

```bash
array=(foo bar baz)
printf "Array\n"
printarr "array"
declare -A assoc_array
assoc_array=([foo]=bar [baz]=foobar)
printf "Assoc Array\n"
printarr "assoc_array"
#Output
Array
0 = foo
1 = bar
2 = baz
Assoc Array
baz = foobar
foo = bar
```

### debug::print_ansi()

Function to print ansi escape sequence as is.
This function helps debug ansi escape sequence in text by displaying the escape codes.

#### Arguments

- **$1** (string): input with ansi escape sequence.

#### Output on stdout

- Ansi escape sequence printed in output as is.

#### Example

```bash
txt="$(tput bold)$(tput setaf 9)This is bold red text$(tput sgr0).$(tput setaf 10)This is green text$(tput sgr0)"
debug::print_ansi "$txt"
#Output
\e[1m\e[91mThis is bold red text\e(B\e[m.\e[92mThis is green text\e(B\e[m
```

## File

Functions for handling files.

### file::make_temp_file()

Create temporary file.
Function creates temporary file with random name. The temporary file will be deleted when script finishes.

*Function has no arguments.*

#### Exit codes

- **0**:  If successful.
- **1**: If failed to create temp file.

#### Output on stdout

- file name of temporary file created.

#### Example

```bash
echo "$(file::make_temp_file)"
#Output
tmp.vgftzy
```

### file::make_temp_dir()

Create temporary directory.
Function creates temporary directory with random name. The temporary directory will be deleted when script finishes.

#### Arguments

- **$1** (string): Temporary directory prefix
- $2  string Flag to auto remove directory on exit trap (true)

#### Exit codes

- **0**:  If successful.
- **1**: If failed to create temp directory.
- **2**: Missing arguments.

#### Output on stdout

- directory name of temporary directory created.

#### Example

```bash
echo "$(utility::make_temp_dir)"
#Output
tmp.rtfsxy
```

### file::name()

Get only the filename from string path.

#### Arguments

- **$1** (string): path.

#### Exit codes

- **0**:  If successful.
- **2**: Function missing arguments.

#### Output on stdout

- name of the file with extension.

#### Example

```bash
echo "$(file::name "/path/to/test.md")"
#Output
test.md
```

### file::basename()

Get the basename of file from file name.

#### Arguments

- **$1** (string): path.

#### Exit codes

- **0**:  If successful.
- **2**: Function missing arguments.

#### Output on stdout

- basename of the file.

#### Example

```bash
echo "$(file::basename "/path/to/test.md")"
#Output
test
```

### file::extension()

Get the extension of file from file name.

#### Arguments

- **$1** (string): path.

#### Exit codes

- **0**:  If successful.
- **1**: If no extension is found in the filename.
- **2**: Function missing arguments.

#### Output on stdout

- extension of the file.

#### Example

```bash
echo "$(file::extension "/path/to/test.md")"
#Output
md
```

### file::dirname()

Get directory name from file path.

#### Arguments

- **$1** (string): path.

#### Exit codes

- **0**:  If successful.
- **2**: Function missing arguments.

#### Output on stdout

- directory path.

#### Example

```bash
echo "$(file::dirname "/path/to/test.md")"
#Output
/path/to
```

### file::full_path()

Get absolute path of file or directory.

#### Arguments

- **$1** (string): relative or absolute path to file/direcotry.

#### Exit codes

- **0**:  If successful.
- **1**:  If file/directory does not exist.
- **2**: Function missing arguments.

#### Output on stdout

- Absolute path to file/directory.

#### Example

```bash
file::full_path "../path/to/file.md"
#Output
/home/labbots/docs/path/to/file.md
```

### file::mime_type()

Get mime type of provided input.

#### Arguments

- **$1** (string): relative or absolute path to file/directory.

#### Exit codes

- **0**:  If successful.
- **1**:  If file/directory does not exist.
- **2**: Function missing arguments.
- **3**: If file or mimetype command not found in system.

#### Output on stdout

- mime type of file/directory.

#### Example

```bash
file::mime_type "../src/file.sh"
#Output
application/x-shellscript
```

### file::contains_text()

Search if a given pattern is found in file.

#### Arguments

- **$1** (string): relative or absolute path to file/directory.
- **$2** (string): search key or regular expression.

#### Exit codes

- **0**:  If given search parameter is found in file.
- **1**:  If search paramter not found in file.
- **2**: Function missing arguments.

#### Example

```bash
file::contains_text "./file.sh" "^[ @[:alpha:]]*"
file::contains_text "./file.sh" "@file"
#Output
0
```

## Format

Functions to format provided input.

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

## Interaction

Functions to enable interaction with the user.

### interaction::prompt_yes_no()

Prompt yes or no question to the user.

#### Arguments

- **$1** (string): The question to be prompted to the user.
- **$2** (string): default answer \[yes/no\] (optional).

#### Exit codes

- **0**:  If user responds with yes.
- **1**:  If user responds with no.
- **2**: Function missing arguments.

#### Example

```bash
interaction::prompt_yes_no "Are you sure to proceed" "yes"
#Output
Are you sure to proceed (y/n)? [y]
```

### interaction::prompt_response()

Prompt question to the user.

#### Arguments

- **$1** (string): The question to be prompted to the user.
- **$2** (string): default answer (optional).

#### Exit codes

- **0**:  If user responds with answer.
- **2**: Function missing arguments.

#### Output on stdout

- User entered answer to the question.

#### Example

```bash
interaction::prompt_response "Choose directory to install" "/home/path"
#Output
Choose directory to install? [/home/path]
```

## Json

Simple json manipulation. These functions does not completely replace `jq` in any way.

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

## Miscellaneous

Set of miscellaneous helper functions.

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

## Operating System

Functions to detect Operating system and version.

### os::detect_os()

Identify the OS the function is run on.

*Function has no arguments.*

#### Exit codes

- **0**:  If OS is successfully detected.
- **1**: If unable to detect OS.

#### Output on stdout

- Operating system name (linux, mac or windows).

#### Example

```bash
os::detect_os
#Output
linux
```

### os::detect_linux_distro()

Identify the distribution flavour of linux.

*Function has no arguments.*

#### Exit codes

- **0**:  If Linux distro is successfully detected.
- **1**: If unable to detect OS distro.

#### Output on stdout

- Linux OS distribution name (ubuntu, debian, suse, etc.,).

#### Example

```bash
os::detect_linux_distro
#Output
ubuntu
```

### os::detect_linux_version()

Identify the Linux version.

*Function has no arguments.*

#### Exit codes

- **0**:  If Linux version is successfully detected.
- **1**: If unable to detect Linux version.

#### Output on stdout

- Linux OS version number (18.04, 20.04, etc.,).

#### Example

```bash
os::detect_linux_version
#Output
20.04
```

### os::detect_mac_version()

Identify the MacOS version.

*Function has no arguments.*

#### Exit codes

- **0**:  If MacOS version is successfully detected.
- **1**: If unable to detect MacOS version.

#### Output on stdout

- MacOS version number (10.15.6, etc.,)

#### Example

```bash
os::detect_linux_version
#Output
10.15.7
```

## String

Functions for string operations and manipulations.

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

## Terminal

Set of useful terminal functions.

### terminal::is_term()

Check if script is run in terminal.

*Function has no arguments.*

#### Exit codes

- **0**:  If script is run on terminal.
- **1**: If script is not run on terminal.

### terminal::detect_profile()

Detect profile rc file for zsh and bash of current script running user.

*Function has no arguments.*

#### Exit codes

- **0**:  If script is run on terminal.
- **1**: If script is not run on terminal.

#### Output on stdout

- path to the profile file.

### terminal::clear_line()

Clear the output in terminal on the specified line number.
This function clears line only on terminal.

#### Arguments

- **$1** (Line): number to clear. Defaults to 1. (optional)

#### Exit codes

- **0**:  If script is run on terminal.

#### Output on stdout

- clear line ansi code.

## Validation

Functions to perform validation on given data.

### validation::email()

Validate whether a given input is a valid email address or not.

#### Arguments

- **$1** (string): input email address to validate.

#### Exit codes

- **0**:  If provided input is an email address.
- **1**:  If provided input is not an email address.
- **2**: Function missing arguments.

#### Example

```bash
test='test@gmail.com'
validation::email "${test}"
echo $?
#Output
0
```

### validation::ipv4()

Validate whether a given input is a valid IP V4 address.

#### Arguments

- **$1** (string): input IPv4 address.

#### Exit codes

- **0**:  If provided input is a valid IPv4.
- **1**:  If provided input is not a valid IPv4.
- **2**: Function missing arguments.

#### Example

```bash
ips='
     4.2.2.2
     a.b.c.d
     192.168.1.1
     0.0.0.0
     255.255.255.255
     255.255.255.256
     192.168.0.1
     192.168.0
     1234.123.123.123
     0.192.168.1
     '
for ip in $ips; do
   if validation::ipv4 $ip; then stat='good'; else stat='bad'; fi
   printf "%-20s: %s\n" "$ip" "$stat"
done
#Output
4.2.2.2             : good
a.b.c.d             : bad
192.168.1.1         : good
0.0.0.0             : good
255.255.255.255     : good
255.255.255.256     : bad
192.168.0.1         : good
192.168.0           : bad
1234.123.123.123    : bad
0.192.168.1         : good
```

### validation::ipv6()

Validate whether a given input is a valid IP V6 address.

#### Arguments

- **$1** (string): input IPv6 address.

#### Exit codes

- **0**:  If provided input is a valid IPv6.
- **1**:  If provided input is not a valid IPv6.
- **2**: Function missing arguments.

#### Example

```bash
ips='
     2001:db8:85a3:8d3:1319:8a2e:370:7348
     fe80::1ff:fe23:4567:890a
     fe80::1ff:fe23:4567:890a%eth2
     2001:0db8:85a3:0000:0000:8a2e:0370:7334:foo:bar
     fezy::1ff:fe23:4567:890a
     ::
     2001:db8::
     '
for ip in $ips; do
  if validation::ipv6 $ip; then stat='good'; else stat='bad'; fi
  printf "%-50s= %s\n" "$ip" "$stat"
done
#Output
2001:db8:85a3:8d3:1319:8a2e:370:7348              = good
fe80::1ff:fe23:4567:890a                          = good
fe80::1ff:fe23:4567:890a%eth2                     = good
2001:0db8:85a3:0000:0000:8a2e:0370:7334:foo:bar   = bad
fezy::1ff:fe23:4567:890a                          = bad
::                                                = good
2001:db8::                                        = good
```

### validation::alpha()

Validate if given variable is entirely alphabetic characters.

#### Arguments

- **$1** (string): Value of variable to validate.

#### Exit codes

- **0**:  If input is only alpha characters.
- **1**: If input contains any non alpha characters.
- **2**: Function missing arguments.

#### Example

```bash
test='abcABC'
validation::alpha "${test}"
echo $?
#Output
0
```

### validation::alpha_num()

Check if given variable contains only alpha-numeric characters.

#### Arguments

- **$1** (string): Value of variable to validate.

#### Exit codes

- **0**:  If input is an alpha-numeric.
- **1**: If input is not an alpha-numeric.
- **2**: Function missing arguments.

#### Example

```bash
test='abc123'
validation::alpha_num "${test}"
echo $?
#Output
0
```

### validation::alpha_dash()

Validate if given variable contains only alpha-numeric characters, as well as dashes and underscores.

#### Arguments

- **$1** (string): Value of variable to validate.

#### Exit codes

- **0**:  If input is valid.
- **1**: If input the input is not valid.
- **2**: Function missing arguments.

#### Example

```bash
test='abc-ABC_cD'
validation::alpha_dash "${test}"
echo $?
#Output
0
```

### validation::version_comparison()

Compares version numbers and provides return based on whether the value in equal, less than or greater.

#### Arguments

- **$1** (string): Version number to check (eg: 1.0.1)

#### Exit codes

- **0**: version number is equal.
- **1**: $1 version number is greater than $2.
- **2**: $1 version number is less than $2.
- **3**: Function is missing required arguments.
- **4**: Provided input argument is in invalid format.

#### Example

```bash
test='abc-ABC_cD'
validation::version_comparison "12.0.1" "12.0.1"
echo $?
#Output
0
```

## Variable

Functions for handling variables.

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

### variable::is_empty_or_null()

Check if given variable is empty or null.

#### Arguments

- **$1** (mixed): Value of variable to check.

#### Exit codes

- **0**:  If input is empty or null.
- **1**: If input is not empty or null.

#### Example

```bash
test=''
variable::is_empty_or_null $test
#Output
0
```

<!-- END generate_readme.sh generated SHDOC please keep comment here to allow auto update -->

## Inspired By

- [Bash Bible](https://github.com/dylanaraps/pure-bash-bible) - A collection of pure bash alternatives to external processes.
  
## License

[MIT](https://github.com/labbots/google-drive-upload/blob/master/LICENSE)
