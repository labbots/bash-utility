---
title: "Installation"
date: 2020-06-09T23:36:37+01:00
---

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
