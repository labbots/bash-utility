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

# @description Get list of process ids based on process name.
#
# @example
#   misc::get_pid "chrome"
#   #Ouput
#   25951
#   26043
#   26528
#   26561
#
# @arg $1 Name of the process to search.
#
# @exitcode 0  If match successful.
# @exitcode 2 Function missing arguments.
#
# @stdout list of process ids.
misc::get_pid() {
    [[ $# = 0 ]] && printf "%s: Missing arguments\n" "${FUNCNAME[0]}" && return 2

    pgrep "${1}"
}

# @description Get user id based on username.
#
# @example
#   misc::get_uid "labbots"
#   #Ouput
#   1000
#
# @arg $1 username to search.
#
# @exitcode 0  If match successful.
# @exitcode 2 Function missing arguments.
#
# @stdout string uid for the username.
misc::get_uid() {
    [[ $# = 0 ]] && printf "%s: Missing arguments\n" "${FUNCNAME[0]}" && return 2

    user_id=$(id "${1}" 2> /dev/null)
    declare -i ret=$?
    if [[ $ret -ne 0 ]]; then
        printf "No user found with username: %s" "${1}\n"
        return 1
    fi

    printf "%s\n" "${user_id}" | sed -e 's/(.*$//' -e 's/^uid=//'

    unset user_id
}

# @description Generate random uuid.
#
# @example
#   misc::generate_uuid
#   #Ouput
#   65bc64d1-d355-4ffc-a9d9-dc4f3954c34c
#
# @noargs
#
# @exitcode 0  If match successful.
#
# @stdout random generated uuid.
misc::generate_uuid() {
    C="89ab"

    for ((N=0;N<16;++N)); do
        B="$((RANDOM%256))"

        case "$N" in
            6)  printf '4%x' "$((B%16))" ;;
            8)  printf '%c%x' "${C:$RANDOM%${#C}:1}" "$((B%16))" ;;

            3|5|7|9)
                printf '%02x-' "$B"
            ;;

            *)
                printf '%02x' "$B"
            ;;
        esac
    done

    printf '\n'
}
