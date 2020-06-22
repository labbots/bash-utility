#!/usr/bin/env bash

# @file Debug
# @brief Functions to facilitate debugging scripts.

# @description Prints the content of array as key value pair for easier debugging.
# Pass the variable name of the array instead of value of the variable.
# @example
#   array=(foo bar baz)
#   printf "Array\n"
#   printarr "array"
#   declare -A assoc_array
#   assoc_array=([foo]=bar [baz]=foobar)
#   printf "Assoc Array\n"
#   printarr "assoc_array"
#   #Output
#   Array
#   0 = foo
#   1 = bar
#   2 = baz
#   Assoc Array
#   baz = foobar
#   foo = bar
#
# @arg $1 string variable name of the array.
#
# @stdout Formatted key value of array.
debug::print_array() {
    declare -n __arr="$1"
    for k in "${!__arr[@]}"; do printf "%s = %s\n" "$k" "${__arr[$k]}"; done
}

# @description Function to print ansi escape sequence as is.
# This function helps debug ansi escape sequence in text by displaying the escape codes.
#
# @example
#   txt="$(tput bold)$(tput setaf 9)This is bold red text$(tput sgr0).$(tput setaf 10)This is green text$(tput sgr0)"
#   debug::print_ansi "$txt"
#   #Output
#   \e[1m\e[91mThis is bold red text\e(B\e[m.\e[92mThis is green text\e(B\e[m
#
# @arg $1 string input with ansi escape sequence.
#
# @stdout Ansi escape sequence printed in output as is.
debug::print_ansi() {
    #echo $(tr -dc '[:print:]'<<<$1)
    printf "%s\n" "${1//$'\e'/\\e}"

}
