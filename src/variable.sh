#!/usr/bin/env bash

# @file Variable
# @brief Functions for handling variables.

# @description Check if given variable is array.
#
# @example
#   array=("a" "b" "c")
#   variable::is_array "${array[@]}"
#   #Output
#   0
#
# @arg $1 mixed Value of variable to check.
#
# @exitcode 0  If input is array.
# @exitcode 1 If input is not an array.
variable::is_array() {
    declare input=("$@")
    if [[ -z "${1}" ]]; then
        return 1
    elif [[ "${#input[@]}" -gt 1 ]]; then
        return 0
    else
        return 1
    fi
}

# @description Check if given variable is a number.
#
# @example
#   variable::is_numeric "1234"
#   #Output
#   0
#
# @arg $1 mixed Value of variable to check.
#
# @exitcode 0  If input is number.
# @exitcode 1 If input is not a number.
variable::is_numeric() {
    re='^[0-9]+$'
    if [[ ${1} =~ $re ]]; then
        return 0
    fi
    return 1
}

# @description Check if given variable is an integer.
#
# @example
#   variable::is_int "+1234"
#   #Output
#   0
#
# @arg $1 mixed Value of variable to check.
#
# @exitcode 0  If input is an integer.
# @exitcode 1 If input is not an integer.
variable::is_int() {
    declare re='^[+-]?[0-9]+$'
    if [[ ${1} =~ $re ]]; then
        return 0
    fi
    return 1
}

# @description Check if given variable is a float.
#
# @example
#   variable::is_float "+1234.0"
#   #Output
#   0
#
# @arg $1 mixed Value of variable to check.
#
# @exitcode 0  If input is a float.
# @exitcode 1 If input is not a float.
variable::is_float() {
    declare re='^[+-]?[0-9]+.?[0-9]*$'
    if [[ ${1} =~ $re ]]; then
        return 0
    fi
    return 1
}

# @description Check if given variable is a boolean.
#
# @example
#   variable::is_bool "true"
#   #Output
#   0
#
# @arg $1 mixed Value of variable to check.
#
# @exitcode 0  If input is a boolean.
# @exitcode 1 If input is not a boolean.
variable::is_bool() {
    [[ "${1}" = true || "${1}" = false ]] && return 0 || return 1;
}

# @description Check if given variable is a true.
#
# @example
#   variable::is_true "true"
#   #Output
#   0
#
# @arg $1 mixed Value of variable to check.
#
# @exitcode 0  If input is true.
# @exitcode 1 If input is not true.
variable::is_true() {
    [[ "${1}" = true || "${1}" -eq 0 ]] && return 0 || return 1;
}

# @description Check if given variable is false.
#
# @example
#   variable::is_false "false"
#   #Output
#   0
#
# @arg $1 mixed Value of variable to check.
#
# @exitcode 0  If input is false.
# @exitcode 1 If input is not false.
variable::is_false() {
    [[ "${1}" = false || "${1}" -eq 1 ]] && return 0 || return 1;
}
