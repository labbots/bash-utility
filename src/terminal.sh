#!/usr/bin/env bash

# @file Terminal
# @brief Set of useful terminal functions.

# @description Check if script is run in terminal.
#
# @noargs
#
# @exitcode 0  If script is run on terminal.
# @exitcode 1 If script is not run on terminal.
terminal::is_term() {
    [[ -t 1 || -z ${TERM} ]] && return 0 || return 1
}

# @description Detect profile rc file for zsh and bash of current script running user.
#
# @noargs
#
# @exitcode 0  If script is run on terminal.
# @exitcode 1 If script is not run on terminal.
#
# @stdout path to the profile file.
terminal::detect_profile() {
    declare CURRENT_SHELL="${SHELL##*/}"
    case "${CURRENT_SHELL}" in
        'bash') DETECTED_PROFILE="${HOME}/.bashrc" ;;
        'zsh') DETECTED_PROFILE="${HOME}/.zshrc" ;;
        *) if [[ -f "${HOME}/.profile" ]]; then
            DETECTED_PROFILE="${HOME}/.profile"
        else
            printf "No compaitable shell file\n" && exit 1
        fi ;;
    esac
    printf "%s\n" "${DETECTED_PROFILE}"
}

# @description Clear the output in terminal on the specified line number.
# This function clears line only on terminal.
#
# @arg $1 Line number to clear. Defaults to 1. (optional)
#
# @exitcode 0  If script is run on terminal.
#
# @stdout clear line ansi code.
terminal::clear_line() {
    if terminal::is_term; then
        declare line=${1:-1}
        printf "\033[%sA\033[2K" "${line}"
    fi
}
