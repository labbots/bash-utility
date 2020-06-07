#!/usr/bin/env bash

# @file Check
# @brief Helper functions.

# @description Check if the command exists in the system.
#
# @example
#   check::command_exists "tput"
#
# @arg $1 string Command name to be searched.
#
# @exitcode 0  If the command exists.
# @exitcode 1  If the command does not exist.
# @exitcode 2 Function missing arguments.
check::command_exists() {
    [[ $# = 0 ]] && printf "%s: Missing arguments\n" "${FUNCNAME[0]}" && return 2
    hash "${1}" 2> /dev/null
}

# @description Check if the script is executed with sudo privilege.
#
# @example
#   check::is_sudo
#
# @noargs
#
# @exitcode 0  If the script is executed with root privilege.
# @exitcode 1  If the script is not executed with root privilege
check::is_sudo() {
    if [[ $(id -u) -ne 0 ]]; then
        return 1
    fi
}
