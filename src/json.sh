#!/usr/bin/env bash

# @file Json
# @brief Simple json manipulation. These functions does not completely replace `jq` in any way.

# @description Extract value from json based on key and position.
# Input to the function can be a pipe output, here-string or file.
# @example
#   json::get_value "id" "1" < json_file
#   json::get_value "id" <<< "${json_var}"
#   echo "{\"data\":{\"id\":\"123\",\"value\":\"name string\"}}" | json::get_value "id"
#
# @arg $1 string id of the field to fetch.
# @arg $2 int position of value to extract.Defaults to 1.(optional)
#
# @exitcode 0  If match successful.
# @exitcode 2 Function missing arguments.
#
# @stdout string value of extracted key.
json::get_value() {
    [[ $# = 0 ]] && printf "%s: Missing arguments\n" "${FUNCNAME[0]}" && return 2

    declare LC_ALL=C num="${2:-1}"
    grep -o "\"""${1}""\"\:.*" | sed -e "s/.*\"""${1}""\": //" -e 's/[",]*$//' -e 's/["]*$//' -e 's/[,]*$//' -e "s/\"//" -n -e "${num}"p
}
