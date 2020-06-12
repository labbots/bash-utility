---
title : Date 
description : Functions for manipulating dates. 
date : 2020-06-12T01:11:01+01:00
lastmod : 2020-06-12T01:11:01+01:00
---
<!-- START generate_readme.sh generated SHDOC please keep comment here to allow auto update -->


Functions for manipulating dates.

### Table of Contents

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

---

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

---

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

---

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

---

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

---

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

---

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

---

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

---

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

---

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

---

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

---

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

---

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

---

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

---

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

---

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

---

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

---

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

---

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

---

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

---

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

---

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

---

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

---

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

---

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

---

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

---

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

---

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

---

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

---

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

---

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

---

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

---

<!-- END generate_readme.sh generated SHDOC please keep comment here to allow auto update -->
