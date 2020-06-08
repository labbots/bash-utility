#!/usr/bin/env bash

# @file Format
# @brief Functions to format provided input.

# @description Format seconds to human readable format.
#
# @example
#   echo "$(format::human_readable_seconds "356786")"
#   #Output
#   4 days 3 hours 6 minute(s) and 26 seconds
#
# @arg $1 int number of seconds.
#
# @exitcode 0  If successful.
# @exitcode 2 Function missing arguments.
#
# @stdout formatted time string.
format::human_readable_seconds() {
    [[ $# = 0 ]] && printf "%s: Missing arguments\n" "${FUNCNAME[0]}" && return 2

    declare T="${1}"
    declare DAY="$((T / 60 / 60 / 24))" HR="$((T / 60 / 60 % 24))" MIN="$((T / 60 % 60))" SEC="$((T % 60))"
    [[ ${DAY} -gt 0 ]] && printf '%d days ' "${DAY}"
    [[ ${HR} -gt 0 ]] && printf '%d hours ' "${HR}"
    [[ ${MIN} -gt 0 ]] && printf '%d minute(s) ' "${MIN}"
    [[ ${DAY} -gt 0 || ${HR} -gt 0 || ${MIN} -gt 0 ]] && printf 'and '
    printf '%d seconds\n' "${SEC}"
}

# @description Format bytes to human readable format.
#
# @example
#   echo "$(format::bytes_to_human "2250")"
#   #Output
#   2.19 KB
#
# @arg $1 int size in bytes.
#
# @exitcode 0  If successful.
# @exitcode 2 Function missing arguments.
#
# @stdout formatted file size string.
format::bytes_to_human() {
    [[ $# = 0 ]] && printf "%s: Missing arguments\n" "${FUNCNAME[0]}" && return 2

    declare b=${1:-0} d='' s=0 S=(Bytes {K,M,G,T,P,E,Y,Z}B)
    while ((b > 1024)); do
        d="$(printf ".%02d" $((b % 1024 * 100 / 1024)))"
        b=$((b / 1024)) && ((s++))
    done
    printf "%s\n" "${b}${d} ${S[${s}]}"
}
