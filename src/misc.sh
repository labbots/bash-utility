#!/usr/bin/env bash

# @file Miscellaneous
# @brief Set of miscellaneous helper functions.

# @internal
# @description Check if script is run in terminal.
#
# @noargs
#
# @exitcode 0  If script is run on terminal.
# @exitcode 1 If script is not run on terminal.
_is_terminal() {
    [[ -t 1 || -z ${TERM} ]] && return 0 || return 1
}

# @description Check if internet connection is available.
#
# @example
#   misc::check_internet_connection
#
# @noargs
#
# @exitcode 0  If script can connect to internet.
# @exitcode 1 If script cannot access internet.
misc::check_internet_connection() {
    declare check_internet
    if _is_terminal; then
        check_internet="$(sh -ic 'exec 3>&1 2>/dev/null; { curl --compressed -Is google.com 1>&3; kill 0; } | { sleep 10; kill 0; }' || :)"
    else
        check_internet="$(curl --compressed -Is google.com -m 10)"
    fi
    if [[ -z ${check_internet} ]]; then
        return 1
    fi
}
