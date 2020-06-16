#!/usr/bin/env bash

# @file Interaction
# @brief Functions to enable interaction with the user.

# @description Prompt yes or no question to the user.
#
# @example
#   interaction::prompt_yes_no "Are you sure to proceed" "yes"
#   #Output
#   Are you sure to proceed (y/n)? [y]
#
# @arg $1 string The question to be prompted to the user.
# @arg $2 string default answer \[yes/no\] (optional).
#
# @exitcode 0  If user responds with yes.
# @exitcode 1  If user responds with no.
# @exitcode 2 Function missing arguments.
interaction::prompt_yes_no() {
    [[ $# = 0 ]] && printf "%s: Missing arguments\n" "${FUNCNAME[0]}" && return 2
    declare def_arg response
    def_arg=""
    response=""

    case "${2}" in
        [yY] | [yY][eE][sS])
            def_arg=y
            ;;
        [nN] | [nN][oO])
            def_arg=n
            ;;
    esac

    while :; do
        printf "%s (y/n)? " "${1}"
        [[ -n "${def_arg}" ]] && printf "[%s] " "${def_arg}"

        read -r response
        [[ -z "${response}" ]] && response="${def_arg}"

        case "${response}" in
            [yY] | [yY][eE][sS])
                response=y
                break
                ;;
            [nN] | [nN][oO])
                response=n
                break
                ;;
            *)
                response=""
                ;;
        esac
    done

    [[ "${response}" = 'y' ]] && return 0 || return 1
}

# @description Prompt question to the user.
#
# @example
#   interaction::prompt_response "Choose directory to install" "/home/path"
#   #Output
#   Choose directory to install? [/home/path]
#
# @arg $1 string The question to be prompted to the user.
# @arg $2 string default answer (optional).
#
# @exitcode 0  If user responds with answer.
# @exitcode 2 Function missing arguments.
#
# @stdout User entered answer to the question.
interaction::prompt_response() {
    [[ $# = 0 ]] && printf "%s: Missing arguments\n" "${FUNCNAME[0]}" && return 2

    declare def_arg response
    response=""
    def_arg="${2}"

    while :; do
        printf "%s ? " "${1}"
        [[ -n "${def_arg}" ]] && [[ "${def_arg}" != "-" ]] && printf "[%s] " "${def_arg}"

        read -r response
        [[ -n "${response}" ]] && break

        if [[ -z "${response}" ]] && [[ -n "${def_arg}" ]]; then
            response="${def_arg}"
            break
        fi
    done

    [[ "${response}" = "-" ]] && response=""

    printf "%s" "${response}"
}
