#!/usr/bin/env bash

# @file Collection
# @brief (Experimental) Functions to iterates over a list of elements, yielding each in turn to an iteratee function.

# @description Iterates over elements of collection and invokes iteratee for each element.
# Input to the function can be a pipe output, here-string or file.
# @example
#   test_func(){
#      printf "print value: %s\n" "$1"
#      return 0
#    }
#   arr1=("a b" "c d" "a" "d")
#   printf "%s\n" "${arr1[@]}" | collection::each "test_func"
#   collection::each "test_func"  < <(printf "%s\n" "${arr1[@]}") #alternative approach
#   #output
#    print value: a b
#    print value: c d
#    print value: a
#    print value: d
#
# @example
#   # If other function from this library is already used to process the array.
#   # Then following method could be used to pass the array to the function.
#   out=("$(array::dedupe "${arr1[@]}")")
#   collection::each "test_func"  <<< "${out[@]}"
#
# @arg $1 string Iteratee function.
#
# @exitcode 0  If successful.
# @exitcode 2 Function missing arguments.
# @exitcode other exitcode returned by iteratee
#
# @stdout Output of iteratee function.
collection::each() {
    [[ $# = 0 ]] && printf "%s: Missing arguments\n" "${FUNCNAME[0]}" && return 2

    declare IFS=$'\n'
    while read -r it; do
        if [[ "$@" == *"$"* ]]; then
            eval "$@"
        else
            eval "$@" "'${it}'"
        fi
        declare -i ret="$?"

        if [[ $ret -ne 0 ]]; then
            return $ret
        fi

    done
}