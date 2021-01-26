---
title : Validation 
description : Functions to perform validation on given data. 
date : 2020-06-20T13:05:12+01:00
lastmod : 2021-01-26T12:27:04+00:00
---
<!-- START generate_readme.sh generated SHDOC please keep comment here to allow auto update -->


Functions to perform validation on given data.

### Table of Contents

- [validation::email()](#validationemail)
- [validation::ipv4()](#validationipv4)
- [validation::ipv6()](#validationipv6)
- [validation::alpha()](#validationalpha)
- [validation::alpha_num()](#validationalpha_num)
- [validation::alpha_dash()](#validationalpha_dash)
- [validation::version_comparison()](#validationversion_comparison)

---

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

---

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

---

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

---

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

---

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

---

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

---

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

---

<!-- END generate_readme.sh generated SHDOC please keep comment here to allow auto update -->
