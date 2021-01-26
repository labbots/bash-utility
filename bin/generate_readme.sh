#!/usr/bin/env bash

#https://github.com/bkrem/make-toc.sh/blob/master/make-toc.sh
#https://gitlab.com/pedrolab/doctoc.sh/-/blob/master/doctoc.sh
_usage() {
    printf "
Script to autogenerate markdown based on bash source code.\n
The script generates table of contents and bashdoc and update the given markdown file.\n
Usage:\n %s [options.. ]\n
Options:\n
  -f | --file <filename.md> - Relative or absolute path to the README.md file.
  -s | --sh-dir <folderpath> - path to the bash script source folder to generate shdocs.\n
  -l | --toc-level <number> - Minimum level of header to print in Table of Contents.\n
  -d | --toc-depth <number> - Maximum depth of tree to print in Table of Contents.\n
  -w | --webdoc - Flag to indicate generation of webdoc.\n
  -p | --dest-dir <folderpath> - Path in which wedoc files must be generated.\n
  -h | --help - Display usage instructions.\n" "${0##*/}"
    exit 0
}

_setup_arguments() {

    unset MINLEVEL MAXLEVEL SCRIPT_FILE SOURCE_MARKDOWN SOURCE_SCRIPT_DIR SCRIPT_DIR WEBDOC WEBDOC_DEST_DIR
    MINLEVEL=1
    MAXLEVEL=3
    SCRIPT_FILE="${0##*/}"
    declare source="${BASH_SOURCE[0]}"
    while [ -h "$source" ]; do # resolve $source until the file is no longer a symlink
        SCRIPT_DIR="$(cd -P "$(dirname "$source")" > /dev/null 2>&1 && pwd)"
        source="$(readlink "$source")"
        [[ $source != /* ]] && source="$SCRIPT_DIR/$source" # if $SOURCE was a relative symlink, we need to resolve it relative to the path where the symlink file was located
    done
    SCRIPT_DIR="$(cd -P "$(dirname "$source")" > /dev/null 2>&1 && pwd)"
    SOURCE_MARKDOWN="${SCRIPT_DIR}/../README.md"
    SOURCE_SCRIPT_DIR="${SCRIPT_DIR}/../src"
    WEBDOC_DEST_DIR="${SCRIPT_DIR}/../hugo-docs/content/functions"

    SHORTOPTS="whp:f:m:d:s:-:"

    while getopts "${SHORTOPTS}" OPTION; do
        case "${OPTION}" in
            -)
                _check_longoptions() { { [[ -z "$1" ]] && printf '%s: --%s: option requires an argument\nTry '"%s -h/--help"' for more information.\n' "${0##*/}" "${OPTARG}" "${0##*/}" && exit 1; } || :; }
                case "${OPTARG}" in
                    help)
                        _usage
                        ;;
                    file)
                        _check_longoptions "${!OPTIND}"
                        SOURCE_MARKDOWN="${!OPTIND}" && OPTIND=$((OPTIND + 1))
                        ;;
                    toc-level)
                        _check_longoptions "${!OPTIND}"
                        MINLEVEL="${!OPTIND}" && OPTIND=$((OPTIND + 1))
                        ;;
                    toc-depth)
                        _check_longoptions "${!OPTIND}"
                        MAXLEVEL="${!OPTIND}" && OPTIND=$((OPTIND + 1))
                        ;;
                    sh-dir)
                        _check_longoptions "${!OPTIND}"
                        SOURCE_SCRIPT_DIR="${!OPTIND}" && OPTIND=$((OPTIND + 1))
                        ;;
                    webdoc)
                        WEBDOC=true
                        ;;
                    dest-dir)
                        WEBDOC_DEST_DIR="${OPTARG}"
                        ;;
                    '')
                        _usage
                        ;;
                    *)
                        printf '%s: --%s: Unknown option\nTry '"%s -h/--help"' for more information.\n' "${0##*/}" "${OPTARG}" "${0##*/}" && exit 1
                        ;;
                esac
                ;;
            h)
                _usage
                ;;
            f)
                SOURCE_MARKDOWN="${OPTARG}"
                ;;
            m)
                MINLEVEL="${OPTARG}"
                ;;
            d)
                MAXLEVEL="${OPTARG}"
                ;;
            s)
                SOURCE_SCRIPT_DIR="${OPTARG}"
                ;;
            w)
                WEBDOC=true
                ;;
            p)
                WEBDOC_DEST_DIR="${OPTARG}"
                ;;
            :)
                printf '%s: -%s: option requires an argument\nTry '"%s -h/--help"' for more information.\n' "${0##*/}" "${OPTARG}" "${0##*/}" && exit 1
                ;;
            ?)
                printf '%s: -%s: Unknown option\nTry '"%s -h/--help"' for more information.\n' "${0##*/}" "${OPTARG}" "${0##*/}" && exit 1
                ;;
        esac
    done
    shift "$((OPTIND - 1))"

    if [[ -w "${SOURCE_MARKDOWN}" ]]; then
        declare src_file src_extension
        src_file="${SOURCE_MARKDOWN##*/}"
        src_extension="${src_file##*.}"
        if [[ "${src_extension,,}" != "md" ]]; then
            printf "Provided file %s is not a markdown.\n" "${src_file}" && exit 1
        fi
    else
        printf "Provided file %s does not exist or no enough permission to access it.\n" "${SOURCE_MARKDOWN}" && exit 1
    fi

    if [[ ! -d "${SOURCE_SCRIPT_DIR}" ]]; then
        printf "Provided directory for bash script files %s does not exist.\n" "${SOURCE_SCRIPT_DIR}" && exit 1
    fi

    declare re='^[0-9]+$'
    if ! [[ "${MINLEVEL}" =~ $re ]] || ! [[ "${MAXLEVEL}" =~ $re ]]; then
        echo "error: Not a number" >&2
        exit 1
    fi
    if [[ "${MINLEVEL}" -gt "${MAXLEVEL}" ]]; then
        printf "Minimum level for TOC cannot be greater than the depth of TOC to be printed.\n" && exit 1
    fi

    [ -d "${WEBDOC_DEST_DIR}" ] || mkdir -p "${WEBDOC_DEST_DIR}"

}

_setup_tempfile() {
    declare temp_file
    type -p mktemp &> /dev/null && { temp_file="$(mktemp -u)" || temp_file="${PWD}/$((RANDOM * 2)).LOG"; }
    trap 'rm -f "${temp_file}"' EXIT
    printf "%s" "${temp_file}"
}

_generate_shdoc() {
    declare file
    file="$(realpath "${1}")"
    if [[ -s "${file}" ]]; then
        awk -v style="readme" -v toc=0 -f "${SCRIPT_DIR}"/bashdoc.awk < "${file}" >> "$2"
        #awk -v style="doc" -v toc=1 -f "${SCRIPT_DIR}"/bashdoc.awk < "${file}" >> "../docs/${file##*/}.md"
    fi
}

_insert_shdoc_to_file() {
    declare shdoc_tmp_file source_markdown start_shdoc info_shdoc end_shdoc
    shdoc_tmp_file="$1"
    source_markdown="$2"

    start_shdoc="<!-- START ${SCRIPT_FILE} generated SHDOC please keep comment here to allow auto update -->"
    info_shdoc="<!-- DO NOT EDIT THIS SECTION, INSTEAD RE-RUN ${SCRIPT_FILE} TO UPDATE -->"
    end_shdoc="<!-- END ${SCRIPT_FILE} generated SHDOC please keep comment here to allow auto update -->"

    sed -i "1s/^/${info_shdoc}\n/" "${shdoc_tmp_file}"

    if grep --color=always -Pzl "(?s)${start_shdoc}.*\n.*${end_shdoc}" "${source_markdown}" &> /dev/null; then
        # src https://stackoverflow.com/questions/2699666/replace-delimited-block-of-text-in-file-with-the-contents-of-another-file

        sed -i -ne "/${start_shdoc}/ {p; r ${shdoc_tmp_file}" -e ":a; n; /${end_shdoc}/ {p; b}; ba}; p" "${source_markdown}"
        echo -e "Updated bashdoc content to ${source_markdown} successfully\n"

    else
        {
            printf "%s\n" "${start_shdoc}"
            cat "${shdoc_tmp_file}"
            printf "%s\n" "${end_shdoc}"
        } >> "${source_markdown}"
        echo -e "Created bashdoc content to ${source_markdown} successfully\n"
    fi
}

_process_sh_files() {
    declare shdoc_tmp_file source_script_dir source_markdown
    source_markdown="${1}"
    source_script_dir="${2}"
    shdoc_tmp_file=$(_setup_tempfile)
    find "${source_script_dir}" -name '*.sh' -print0 | sort -z |
        while IFS= read -r -d '' line; do
            _generate_shdoc "${line}" "${shdoc_tmp_file}"
        done
    _insert_shdoc_to_file "${shdoc_tmp_file}" "${source_markdown}"
    rm "${shdoc_tmp_file}"

}

_generate_toc() {

    declare line level title anchor output counter temp_output invalid_chars

    invalid_chars="'[]/?!:\`.,()*\";{}+=<>~$|#@&–—"
    while IFS='' read -r line || [[ -n "${line}" ]]; do
        level="$(echo "${line}" | sed -E 's/(#+).*/\1/; s/#/  /g; s/^  //')"
        title="$(echo "${line}" | sed -E 's/^#+ //')"
        [[ "${title}" = "Table of Contents" ]] && continue

        # tr does not do OK the lowercase for non ascii chars, add sed to pipeline -> src https://stackoverflow.com/questions/13381746/tr-upper-lower-with-cyrillic-text
        anchor="$(echo "${title}" | tr '[:upper:] ' '[:lower:]-' | sed 's/[[:upper:]]*/\L&/' | tr -d "${invalid_chars}")"

        # check new line introduced is not duplicated, if is duplicated, introduce a number at the end
        temp_output=$output"$level- [$title](#$anchor)\n"
        counter=1
        while true; do
            nlines="$(echo -e "${temp_output}" | wc -l)"
            duplines="$(echo -e "${temp_output}" | sort | uniq | wc -l)"
            if [ "${nlines}" = "${duplines}" ]; then
                break
            fi
            temp_output=$output"$level- [$title](#$anchor-$counter)\n"
            counter=$((counter + 1))
        done

        output="$temp_output"

        # grep: filter header candidates to be included in toc
        # sed: remove the ignored headers (case: minlevel greater than one) to avoid unnecessary spacing later in level variable assignment
    done <<< "$(grep -E "^#{${MINLEVEL},${MAXLEVEL}} " "${1}" | tr -d '\r' | sed "s/^#\{$((MINLEVEL - 1))\}//g")"

    # when in toc we have two `--` quit one
    echo "$output"

}

_insert_toc_to_file() {

    declare source_markdown toc_text start_toc info_toc end_toc toc_block utext_ampersand utext_slash
    source_markdown="${1}"
    toc_text="${2}"
    start_toc="<!-- START ${SCRIPT_FILE} generated TOC please keep comment here to allow auto update -->"
    info_toc="<!-- DO NOT EDIT THIS SECTION, INSTEAD RE-RUN ${SCRIPT_FILE} TO UPDATE -->"
    end_toc="<!-- END ${SCRIPT_FILE} generated TOC please keep comment here to allow auto update -->"

    toc_block="$start_toc\n$info_toc\n## Table of Contents\n\n$toc_text\n$end_toc"
    # temporary replace of '/' (confused with separator of substitutions) and '&' (confused with match regex symbol) to run the special sed command
    utext_ampersand="id8234923000230gzz"
    utext_slash="id9992384923423gzz"
    toc_block="${toc_block//\&/${utext_ampersand}}"
    toc_block="${toc_block//\//${utext_slash}}"

    # search multiline toc block -> https://stackoverflow.com/questions/2686147/how-to-find-patterns-across-multiple-lines-using-grep/2686705
    # grep color for debugging -> https://superuser.com/questions/914856/grep-display-all-output-but-highlight-search-matches
    if grep --color=always -Pzl "(?s)${start_toc}.*\n.*${end_toc}" "${source_markdown}" &> /dev/null; then
        # src https://askubuntu.com/questions/533221/how-do-i-replace-multiple-lines-with-single-word-in-fileinplace-replace
        sed -i ":a;N;\$!ba;s/$start_toc.*$end_toc/$toc_block/g" "${source_markdown}"
        echo -e "Updated TOC content in ${source_markdown} succesfully\n"

    else
        sed -i 1i"$toc_block" "${source_markdown}"
        echo -e "Created TOC in ${source_markdown} succesfully\n"

    fi

    # undo symbol replacements
    sed -i "s,${utext_ampersand},\&,g" "${source_markdown}"
    sed -i "s,${utext_slash},\/,g" "${source_markdown}"

}

_process_toc() {
    declare toc_temp_file source_markdown level toc_text
    source_markdown="${1}"

    toc_temp_file=$(_setup_tempfile)

    sed '/```/,/```/d' "${source_markdown}" > "${toc_temp_file}"

    level=$MINLEVEL
    while [[ $(grep -Ec "^#{$level} " "${toc_temp_file}") -le 1 ]]; do
        level=$((level + 1))
    done

    MINLEVEL=${level}
    toc_text=$(_generate_toc "${toc_temp_file}")
    rm "${toc_temp_file}"

    _insert_toc_to_file "${source_markdown}" "${toc_text}"
}

_generate_webdoc() {
    declare dest_dir filename file_basename dest_file_path shdoc_tmp_file is_new_file
    declare title description start_shdoc end_shdoc file_modified_date file_modified_date_epoc
    declare webdoc_lastmod_date webdoc_lastmod_epoc
    file="$(realpath "${1}")"
    dest_dir="${2}"

    filename="${file##*/}"
    file_basename="${filename%.*}"
    dest_file_path="${dest_dir}/${file_basename}.md"
    file_modified_date="$(date -r "${file}" +"%FT%T%:z")"
    file_modified_date_epoc="$(date -r "${file}" +"%s")"

    start_shdoc="<!-- START ${SCRIPT_FILE} generated SHDOC please keep comment here to allow auto update -->"
    end_shdoc="<!-- END ${SCRIPT_FILE} generated SHDOC please keep comment here to allow auto update -->"
    if [[ ! -f "${dest_file_path}" ]]; then

        cat << EOF > "${dest_file_path}"
---
title : <!-- file -->
description : <!-- brief -->
date : ${file_modified_date}
lastmod : ${file_modified_date}
---
${start_shdoc}
${end_shdoc}
EOF
        is_new_file=true
    else
        is_new_file=false
        webdoc_lastmod_date="$(sed -ne 's/-->//; s/^.*lastmod : //p' "${dest_file_path}")"
        webdoc_lastmod_epoc="$(date -d "${webdoc_lastmod_date}" +"%s")"
    fi

    if [[ "${is_new_file}" = true || "${file_modified_date_epoc}" -gt "${webdoc_lastmod_epoc}" ]]; then

        shdoc_tmp_file=$(_setup_tempfile)
        if [[ -s "${file}" ]]; then
            awk -v style="webdoc" -v toc=1 -f "${SCRIPT_DIR}"/bashdoc.awk < "${file}" >> "${shdoc_tmp_file}"
        fi

        if grep --color=always -Pzl "(?s)${start_shdoc}.*\n.*${end_shdoc}" "${dest_file_path}" &> /dev/null; then
            sed -i -ne "/${start_shdoc}/ {p; r ${shdoc_tmp_file}" -e ":a; n; /${end_shdoc}/ {p; b}; ba}; p" "${dest_file_path}"
        fi

        # Extract title and description from webdoc
        title="$(sed -ne 's/-->//; s/^.*<!-- file=//p' "${dest_file_path}")"
        description="$(sed -ne 's/-->//; s/^.*<!-- brief=//p' "${dest_file_path}")"
        sed -i '/^.*<!-- file=/d' "${dest_file_path}"
        sed -i '/^.*<!-- brief=/d' "${dest_file_path}"

        # Replace Frontmatter content with values from the document
        if [[ "${is_new_file}" = true ]]; then

            sed -i -e "s/<!-- file -->/${title}/g" "${dest_file_path}"
            sed -i -e "s/<!-- brief -->/${description}/g" "${dest_file_path}"
        else
            sed -i -e "s/title : .*/title : ${title}/g" "${dest_file_path}"
            sed -i -e "s/description : .*/description : ${description}/g" "${dest_file_path}"

        fi

        # Update the last modified timestamp in front matter
        sed -i -e "s/lastmod : .*/lastmod : ${file_modified_date}/g" "${dest_file_path}"

        echo -e "Updated bashdoc content to ${dest_file_path} successfully."
        rm "${shdoc_tmp_file}"

    fi
}
_process_webdoc_files() {
    declare source_script_dir dest_dir

    source_script_dir="${1}"
    dest_dir="${2}"

    find "${source_script_dir}" -name '*.sh' -print0 | sort -z |
        while IFS= read -r -d '' line; do
            _generate_webdoc "${line}" "${dest_dir}"
        done
}

_count_library_functions() {
    declare source_script_dir
    source_script_dir="${1}"

    find "${source_script_dir}" -name '*.sh' -print0 | sort -z |
        {
            declare -i function_count=0 count=0
            while IFS= read -r -d '' line; do
                count=0
                count=$(grep -c '^[[:alpha:]]*::[[:alnum:]_]*()' "${line}")
                function_count=$((function_count + count))
            done
            printf "Total library functions: %s \n" "${function_count}"

        }
}
main() {
    # export PS4='+(${BASH_SOURCE}:${LINENO}): ${FUNCNAME[0]:+${FUNCNAME[0]}(): }'
    # set -x
    trap 'exit "$?"' INT TERM && trap 'exit "$?"' EXIT
    set -o errexit -o noclobber -o pipefail

    _setup_arguments "${@}"
    _process_sh_files "${SOURCE_MARKDOWN}" "${SOURCE_SCRIPT_DIR}"
    _process_toc "${SOURCE_MARKDOWN}"

    if [[ -n ${WEBDOC} ]]; then
        _process_webdoc_files "${SOURCE_SCRIPT_DIR}" "${WEBDOC_DEST_DIR}"
    fi
    _count_library_functions "${SOURCE_SCRIPT_DIR}"
}

main "${@}"
