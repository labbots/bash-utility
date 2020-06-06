#!/usr/bin/env bash

# @file Array
# @brief Functions for array operations and manipulations.

# @description Check if item exists in the given array.
#
# @example
#   array=("a" "b" "c")
#   array::contains "c" ${array[@]}
#   #Output
#   0
#
# @arg $1 mixed Item to search (needle).
# @arg $2 array array to be searched (haystack).
#
# @exitcode 0  If successful.
# @exitcode 1 If no match found in the array.
# @exitcode 2 Function missing arguments.
array::contains() {
    [[ $# -lt 2 ]] && printf "%s: Missing arguments\n" "${FUNCNAME[0]}" && return 2
    declare query="${1:-}"
    shift

    for element in "${@}"; do
        [[ "${element}" == "${query}" ]] && return 0
    done

    return 1
}

# @description Remove duplicate items from the array
#
# @example
#   array=("a" "b" "a" "c")
#   printf "%s" "$(array::dedupe ${array[@]})"
#   #Output
#   a b c
#
# @arg $1 array Array to be deduped.
#
# @exitcode 0  If successful.
# @exitcode 2 Function missing arguments.
#
# @stdout Deduplicated array.
array::dedupe() {
    [[ $# = 0 ]] && printf "%s: Missing arguments\n" "${FUNCNAME[0]}" && return 2
    declare -A arr_tmp
    declare -a arr_unique
    for i in "$@"; do
        { [[ -z ${i} || ${arr_tmp[${i}]} ]]; } && continue
        arr_unique+=("${i}") && arr_tmp[${i}]=x
    done
    printf '%s\n' "${arr_unique[@]}"
}

# @description Join array elements with a string.
#
# @example
#   array=("a" "b" "c" "d")
#   printf "%s" "$(array::join "," "${array[@]}")"
#   #Output
#   a,b,c,d
#   printf "%s" "$(array::join "" "${array[@]}")"
#   #Output
#   abcd
#
# @arg $1 string String to join the array elements (glue).
# @arg $2 array array to be joined with glue string.
#
# @exitcode 0  If successful.
# @exitcode 2 Function missing arguments.
#
# @stdout String containing a string representation of all the array elements in the same order,with the glue string between each element.
array::join() {
    [[ $# -lt 2 ]] && printf "%s: Missing arguments\n" "${FUNCNAME[0]}" && return 2
    declare delimiter="${1}"
    shift
    printf "%s" "${1}"
    shift
    printf "%s" "${@/#/${delimiter}}"
}

# @description Return an array with elements in reverse order.
#
# @example
#   array=(1 2 3 4 5)
#   printf "%s" "$(array::reverse "${array[@]}")"
#   #Output
#   5 4 3 2 1
#
# @arg $1 array The input array.
#
# @exitcode 0  If successful.
# @exitcode 2 Function missing arguments.
#
# @stdout The reversed array.
array::reverse() {
    [[ $# = 0 ]] && printf "%s: Missing arguments\n" "${FUNCNAME[0]}" && return 2
    declare min=0
    declare -a array
    array=("$@")
    declare max=$((${#array[@]} - 1))

    while [[ $min -lt $max ]]; do
        # Swap current first and last elements
        x="${array[$min]}"
        array[$min]="${array[$max]}"
        array[$max]="$x"

        # Move closer
        ((min++, max--))
    done
    printf '%s\n' "${array[@]}"
}

# @description Returns a random item from the array.
#
# @example
#   array=("a" "b" "c" "d")
#   printf "%s\n" "$(array::random_element "${array[@]}")"
#   #Output
#   c
#
# @arg $1 array The input array.
#
# @exitcode 0  If successful.
# @exitcode 2 Function missing arguments.
#
# @stdout Random item out of the array.
array::random_element() {
    [[ $# = 0 ]] && printf "%s: Missing arguments\n" "${FUNCNAME[0]}" && return 2
    declare -a array
    local array=("$@")
    printf '%s\n' "${array[RANDOM % $#]}"
}
