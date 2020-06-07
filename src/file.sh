#!/usr/bin/env bash

# @file File
# @brief Functions for handling files.

# @description Create temporary file.
# Function creates temporary file with random name. The temporary file will be deleted when script finishes.
#
# @example
#   echo "$(file::make_temp_file)"
#   #Output
#   tmp.vgftzy
#
# @noargs
#
# @exitcode 0  If successful.
# @exitcode 1 If failed to create temp file.
#
# @stdout file name of temporary file created.
file::make_temp_file() {
    declare temp_file
    type -p mktemp &> /dev/null && { temp_file="$(mktemp -u)" || temp_file="${PWD}/$((RANDOM * 2)).LOG"; }
    trap 'rm -f "${temp_file}"' EXIT
    printf "%s" "${temp_file}"
}

# @description Get only the filename from string path.

# @example
#   echo "$(file::name "/path/to/test.md")"
#   #Output
#   test.md
#
# @arg $1 string path.
#
# @exitcode 0  If successful.
# @exitcode 2 Function missing arguments.
#
# @stdout name of the file with extension.
file::name() {
    [[ $# = 0 ]] && printf "%s: Missing arguments\n" "${FUNCNAME[0]}" && return 2
    printf "%s" "${1##*/}"
}

# @description Get the basename of file from file name.

# @example
#   echo "$(file::basename "/path/to/test.md")"
#   #Output
#   test
#
# @arg $1 string path.
#
# @exitcode 0  If successful.
# @exitcode 2 Function missing arguments.
#
# @stdout basename of the file.
file::basename() {
    [[ $# = 0 ]] && printf "%s: Missing arguments\n" "${FUNCNAME[0]}" && return 2

    declare file basename
    file="${1##*/}"
    basename="${file%.*}"

    printf "%s" "${basename}"
}

# @description Get the extension of file from file name.

# @example
#   echo "$(file::extension "/path/to/test.md")"
#   #Output
#   md
#
# @arg $1 string path.
#
# @exitcode 0  If successful.
# @exitcode 1 If no extension is found in the filename.
# @exitcode 2 Function missing arguments.
#
# @stdout extension of the file.
file::extension() {
    [[ $# = 0 ]] && printf "%s: Missing arguments\n" "${FUNCNAME[0]}" && return 2
    declare file extension
    file="${1##*/}"
    extension="${src_file##*.}"
    [[ "${file}" = "${extension}" ]] && return 1

    printf "%s" "${extension}"
}
