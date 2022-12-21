#!/usr/bin/env bash

# @file Array
# @brief Functions for array operations and manipulations.

_print_missing() {
    printf "%s: Missing arguments\n" "${FUNCNAME[1]}"
    return 2
}

# @description Check if item exists in the given array.
#
# @example
#   arr=("a" "b" "c")
#   array::contains "c" "${arr[@]}"" && echo "yes" || echo "no"
#   #Output
#   yes
#
# @arg $1 mixed Item to search (needle).
# @arg $2 array Array to be searched (haystack).
#
# @exitcode 0 If successful.
# @exitcode 1 If no match found in the array.
# @exitcode 2 Function missing arguments.
array::contains() {
    (( $# < 2 )) && { _print_missing; return; }

    local needle="${1:-}"
    shift

    local elem
    for elem in "${@}"; do
        [[ "${elem}" == "${needle}" ]] && return 0
    done

    return 1
}

# @description Remove duplicate items from the array.
#
# @example
#   arr=("a" "b" "a" "c")
#   array::dedupe "${arr[@]}"
#   #Output
#   a
#   b
#   c
#
# @arg $1 array Array to be deduped.
#
# @exitcode 0 If successful.
# @exitcode 2 Function missing arguments.
#
# @stdout Deduplicated array.
array::dedupe() {
    (( $# == 0 )) && { _print_missing; return; }

    local -A found
    local -a unique

    local elem
    for elem in "$@"; do
        [[ -z ${elem} || ${found[${elem}]} ]] && continue
        unique+=("${elem}") && found[${elem}]=1
    done

    printf "%s\n" "${unique[@]}"
}

# @description Check if a given array is empty.
#
# @example
#   array=("a" "b" "c" "d")
#   array::is_empty "${array[@]}"
#
# @arg $1 array Array to be checked.
#
# @exitcode 0 If the given array is empty.
# @exitcode 2 If the given array is not empty.
array::is_empty() {
    local -a array
    local array=("$@")
    if [ ${#array[@]} -eq 0 ]; then
        return 0
    else
        return 1
    fi
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
    (( $# < 2 )) && { _print_missing; return; }
    local delimiter="${1}"
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
    (( $# == 0 )) && { _print_missing; return; }
    local min=0
    local -a array
    array=("$@")
    local max=$((${#array[@]} - 1))

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
    (( $# == 0 )) && { _print_missing; return; }
    local -a array
    local array=("$@")
    printf '%s\n' "${array[RANDOM % $#]}"
}

# @description Sort an array from lowest to highest.
#
# @example
#   sarr=("a c" "a" "d" 2 1 "4 5")
#   array::array_sort "${sarr[@]}"
#   #Output
#   1
#   2
#   4 5
#   a
#   a c
#   d
#
# @arg $1 array The input array.
#
# @exitcode 0  If successful.
# @exitcode 2 Function missing arguments.
#
# @stdout sorted array.
array::sort() {
    (( $# == 0 )) && { _print_missing; return; }
    local -a array=("$@")
    local -a sorted
    local noglobtate
    noglobtate="$(shopt -po noglob)"
    set -o noglob
    local IFS=$'\n'
    sorted=($(sort <<< "${array[*]}"))
    unset IFS
    eval "${noglobtate}"
    printf "%s\n" "${sorted[@]}"
}

# @description Sort an array in reverse order (highest to lowest).
#
# @example
#   sarr=("a c" "a" "d" 2 1 "4 5")
#   array::array_sort "${sarr[@]}"
#   #Output
#   d
#   a c
#   a
#   4 5
#   2
#   1
#
# @arg $1 array The input array.
#
# @exitcode 0  If successful.
# @exitcode 2 Function missing arguments.
#
# @stdout reverse sorted array.
array::rsort() {
    (( $# == 0 )) && { _print_missing; return; }
    local -a array=("$@")
    local -a sorted
    local noglobtate
    noglobtate="$(shopt -po noglob)"
    set -o noglob
    local IFS=$'\n'
    sorted=($(sort -r<<< "${array[*]}"))
    unset IFS
    eval "${noglobtate}"
    printf "%s\n" "${sorted[@]}"
}

# @description Bubble sort an integer array from lowest to highest.
# This sort does not work on string array.
# @example
#   iarr=(4 5 1 3)
#   array::bsort "${iarr[@]}"
#   #Output
#   1
#   3
#   4
#   5
#
# @arg $1 array The input array.
#
# @exitcode 0  If successful.
# @exitcode 2 Function missing arguments.
#
# @stdout bubble sorted array.
array::bsort() {
    (( $# == 0 )) && { _print_missing; return; }
    local tmp
    local arr=("$@")
    for ((i = 0; i <= $((${#arr[@]} - 2)); ++i)); do
        for ((j = ((i + 1)); j <= ((${#arr[@]} - 1)); ++j)); do
            if [[ ${arr[i]} -gt ${arr[j]} ]]; then
                # echo $i $j ${arr[i]} ${arr[j]}
                tmp=${arr[i]}
                arr[i]=${arr[j]}
                arr[j]=$tmp
            fi
        done
    done
    printf "%s\n" "${arr[@]}"
}

# @description Merge two arrays.
# Pass the variable name of the array instead of value of the variable.
# @example
#   a=("a" "c")
#   b=("d" "c")
#   array::merge "a[@]" "b[@]"
#   #Output
#   a
#   c
#   d
#   c
#
# @arg $1 string variable name of first array.
# @arg $2 string variable name of second array.
#
# @exitcode 0  If successful.
# @exitcode 2 Function missing arguments.
#
# @stdout Merged array.
array::merge() {
    (( $# != 2 )) && { _print_missing; return; }
    local -a arr1=("${!1}")
    local -a arr2=("${!2}")
    local out=("${arr1[@]}" "${arr2[@]}")
    printf "%s\n" "${out[@]}"
}
