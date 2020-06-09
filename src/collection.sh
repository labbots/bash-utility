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
    declare func="${@}"
    declare IFS=$'\n'
    while read -r it; do
        if [[ "${func}" == *"$"* ]]; then
            eval "${func}"
        else
            eval "${func}" "'${it}'"
        fi
        declare -i ret="$?"

        if [[ $ret -ne 0 ]]; then
            return $ret
        fi

    done
}

# @description Checks if iteratee function returns truthy for all elements of collection. Iteration is stopped once predicate returns false.
# Input to the function can be a pipe output, here-string or file.
# @example
#   arri=("1" "2" "3" "4")
#   printf "%s\n" "${arri[@]}" | collection::every "variable::is_numeric"
#
# @arg $1 string Iteratee function.
#
# @exitcode 0  If successful.
# @exitcode 1 If iteratee function fails.
# @exitcode 2 Function missing arguments.
collection::every() {
    [[ $# = 0 ]] && printf "%s: Missing arguments\n" "${FUNCNAME[0]}" && return 2
    declare func="${@}"
    declare IFS=$'\n'
    while read -r it; do
        if [[ "${func}" == *"$"* ]]; then
            eval "${func}"
        else
            eval "${func}" "'${it}'"
        fi
        declare -i ret="$?"

        if [[ $ret -ne 0 ]]; then
            return 1
        fi

    done
}

# @description Iterates over elements of array, returning all elements where iteratee returns true.
# Input to the function can be a pipe output, here-string or file.
# @example
#   arri=("1" "2" "3" "a")
#   printf "%s\n" "${arri[@]}" | collection::filter "variable::is_numeric"
#   #output
#   1
#   2
#   3
#
# @arg $1 string Iteratee function.
#
# @exitcode 0  If successful.
# @exitcode 2 Function missing arguments.
#
# @stdout array values matching the iteratee function.
collection::filter() {
    [[ $# = 0 ]] && printf "%s: Missing arguments\n" "${FUNCNAME[0]}" && return 2
    declare func="${@}"
    declare IFS=$'\n'
    while read -r it; do
        if [[ "${func}" == *"$"* ]]; then
            eval "${func}"
        else
            eval "${func}" "'${it}'"
        fi
        declare -i ret="$?"
        if [[ $ret = 0 ]]; then
            printf "%s\n" "${it}"
        fi
    done
}

# @description Iterates over elements of collection, returning the first element where iteratee returns true.
# Input to the function can be a pipe output, here-string or file.
# @example
#   arr=("1" "2" "3" "a")
#   check_a(){
#       [[ "$1" = "a" ]]
#   }
#   printf "%s\n" "${arr[@]}" | collection::find "check_a"
#   #output
#   a
#
# @arg $1 string Iteratee function.
#
# @exitcode 0  If successful.
# @exitcode 1 If no match found.
# @exitcode 2 Function missing arguments.
#
# @stdout first array value matching the iteratee function.
function collection::find() {
    [[ $# = 0 ]] && printf "%s: Missing arguments\n" "${FUNCNAME[0]}" && return 2
    declare func="${@}"
    declare IFS=$'\n'
    while read -r it; do

        if [[ "${func}" == *"$"* ]]; then
            eval "${func}"
        else
            eval "${func}" "'$it'"
        fi
        declare -i ret="$?"
        if [[ $ret = 0 ]]; then
            echo "$it"
            return 0
        fi
    done

    return 1
}
