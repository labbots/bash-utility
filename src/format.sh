#!/usr/bin/env bash

# @file Format
# @brief Functions to format provided input.

# @internal
# @description Initialisation script when the code is sourced.
#
# @noargs
__init(){
_check_terminal_window_size
}

# @internal
# @description Checks the terminal window size, if necessary, updates the values of LINES and COLUMNS.
#
# @noargs
_check_terminal_window_size() {
    shopt -s checkwinsize && (: && :)
    trap 'shopt -s checkwinsize; (:;:)' SIGWINCH
}
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

# @description Remove Ansi escape sequences from given text.
#
# @example
#   format::strip_ansi "\e[1m\e[91mThis is bold red text\e(B\e[m.\e[92mThis is green text.\e(B\e[m"
#   #Output
#   This is bold red text.This is green text.
#
# @arg $1 string Input text to be ansi stripped.
#
# @exitcode 0  If successful.
#
# @stdout Ansi stripped text.
format::strip_ansi() {
    declare tmp esc tpa re
    tmp="${1}"
    esc=$(printf "\x1b")
    tpa=$(printf "\x28")
    re="(.*)${esc}[\[${tpa}][0-9]*;*[mKB](.*)"
    while [[ "${tmp}" =~ $re ]]; do
        tmp="${BASH_REMATCH[1]}${BASH_REMATCH[2]}"
    done
    printf "%s" "${tmp}"
}

# @description Prints the given text to centre of terminal.
#
# @example
#   format::text_center "This text is in centre of the terminal." "-"
#
# @arg $1 string Text to be printed.
# @arg $2 string Filler symbol to be added to prefix and suffix of the text (optional). Defaults to space as filler.
#
# @exitcode 0  If successful.
# @exitcode 2 Function missing arguments.
#
# @stdout formatted text.
format::text_center() {
    [[ $# = 0 ]] && printf "%s: Missing arguments\n" "${FUNCNAME[0]}" && return 1

    declare input="${1}" symbol="${2:- }" filler out no_ansi_out
    no_ansi_out=$(format::strip_ansi "$input")
    declare -i str_len=${#no_ansi_out}
    declare -i filler_len="$(((COLUMNS - str_len) / 2))"

    [[ -n "${symbol}" ]] && symbol="${symbol:0:1}"
    for ((i = 0; i < filler_len; i++)); do
        filler+="${symbol}"
    done

    out="${filler}${input}${filler}"
    [[ $(((COLUMNS - str_len) % 2)) -ne 0 ]] && out+="${symbol}"
    printf "%s" "${out}"
}

# @description Format String to print beautiful report.
#
# @example
#   format::report "Initialising mission state" "Success"
#   #Output
#   Initialising mission state ....................................................................[ Success ]
#
# @arg $1 string Text to be printed on the left.
# @arg $2 string Text to be printed within the square brackets.
#
# @exitcode 0  If successful.
# @exitcode 2 Function missing arguments.
#
# @stdout formatted text.
format::report() {
    [[ $# -lt 2 ]] && printf "%s: Missing arguments\n" "${FUNCNAME[0]}" && return 1

    declare symbol="." to_print y hl hlout out
    declare input1="${1} " input2="${2}"
    input2="[ $input2 ]"
    to_print="$((COLUMNS * 60 / 100))"
    y=$(( to_print - ( ${#input1} + ${#input2} ) ))
    hl="$(printf '%*s' $y '')"
    hlout=${hl// /${symbol}}
    out="${input1}${hlout}${input2}"
    printf "%s\n" "${out}"
}

# @description Trim given text to width of the terminal window.
#
# @example
#   format::trim_text_to_term "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat." "This is part of second sentence."
#   #Output
#   Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod..This is part of second sentence.
#
# @arg $1 string Text of first sentence.
# @arg $2 string Text of second sentence (optional).
#
# @exitcode 0  If successful.
# @exitcode 2 Function missing arguments.
#
# @stdout trimmed text.
format::trim_text_to_term() {
    [[ $# = 0 ]] && printf "%s: Missing arguments\n" "${FUNCNAME[0]}" && return 1

    declare to_print out input1="$1" input2="$2"
    if [[ $# = 1 ]]; then
        to_print="$((COLUMNS * 93 / 100))"
        { [[ ${#input1} -gt ${to_print} ]] && out="${input1:0:to_print}.."; } || { out="$input1"; }
    else
        to_print="$((COLUMNS * 40 / 100))"
        { [[ ${#input1} -gt ${to_print} ]] && out+=" ${input1:0:to_print}.."; } || { out+=" $input1"; }
        to_print="$((COLUMNS * 53 / 100))"
        { [[ ${#input2} -gt ${to_print} ]] && out+="${input2:0:to_print}.. "; } || { out+="$input2 "; }
    fi
    printf "%s" "$out"
}

__init
