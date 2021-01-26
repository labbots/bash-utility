---
title : Operating System 
description : Functions to detect Operating system and version. 
date : 2021-01-26T12:34:48+00:00
lastmod : 2021-01-26T12:52:53+00:00
---
<!-- START generate_readme.sh generated SHDOC please keep comment here to allow auto update -->


Functions to detect Operating system and version.

### Table of Contents

- [os::detect_os()](#osdetect_os)
- [os::detect_linux_distro()](#osdetect_linux_distro)
- [os::detect_linux_version()](#osdetect_linux_version)
- [os::detect_mac_version()](#osdetect_mac_version)

---

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

---

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

---

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

---

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

---

<!-- END generate_readme.sh generated SHDOC please keep comment here to allow auto update -->
