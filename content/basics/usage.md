---
title: "Usage"
date: 2020-06-09T23:36:37+01:00
---

Bash utility functions can be used by simply sourcing the library script file to your own script.
To access all the functions within the bash-utility library, you could import the main bash file as follows.

```shell
source "vendor/bash-utility/bash-utility.sh"
```

You can also use only the necessary library functions within your script by only importing the required function files. 

```shell
source "vendor/bash-utility/src/array.sh"
```
