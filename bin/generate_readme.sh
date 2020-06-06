#!/usr/bin/env bash
README="README.md"

_setup() {
    INVALID_CHARS="'[]/?!:\`.,()*\";{}+=<>~$|#@&–—"
    MINLEVEL=1
    MAXLEVEL=3
    SCRIPT_FILE=$(basename $0)
    SCRIPT_FILENAME="${SCRIPT_FILE%.*}"
    rm README.md
    cp readme-template.md "$README"
}

_setup_tempfile() {
    declare temp_file
    type -p mktemp &> /dev/null && { temp_file="$(mktemp -u)" || temp_file="${PWD}/$((RANDOM * 2)).LOG"; }
    trap 'rm -f "${temp_file}"' EXIT
    printf "%s" "${temp_file}"
}

_generate_shdoc() {
    declare file
    file="$(realpath $1)"
    ./shdoc.awk < $file >> "$2"
}

_insert_shdoc_to_file() {
    declare shdoc_tmp_file="$1"
    declare dest_file="$2"

    declare start_shdoc="<!-- START ${SCRIPT_FILE} generated SHDOC please keep comment here to allow auto update -->"
    declare info_shdoc="<!-- DO NOT EDIT THIS SECTION, INSTEAD RE-RUN ${SCRIPT_FILE} TO UPDATE -->"
    declare end_shdoc="<!-- END ${SCRIPT_FILE} generated SHDOC please keep comment here to allow auto update -->"

    sed -i "1s/^/$info_shdoc\n/" "$shdoc_temp_file"

    if grep --color=always -Pzl "(?s)$start_shdoc.*\n.*$end_shdoc" $dest_file &> /dev/null; then
        # src https://stackoverflow.com/questions/2699666/replace-delimited-block-of-text-in-file-with-the-contents-of-another-file

        sed -i -ne "/$start_shdoc/ {p; r $shdoc_temp_file" -e ":a; n; /$end_shdoc/ {p; b}; ba}; p" $dest_file
        echo -e "\n  Updated shdoc content to $dest_file\n"

    else

        echo -e "\n  Created\n"
    fi
}

_process_sh_files() {
    declare shdoc_temp_file=$(_setup_tempfile)
    find ../src -name '*.sh' -print0 | sort -z |
        while IFS= read -r -d '' line; do
            _generate_shdoc "$line" "$shdoc_temp_file"
        done
    _insert_shdoc_to_file "$shdoc_temp_file" "$README"
    rm "$shdoc_temp_file"

}

_generate_toc() {

    declare line level title anchor output counter temp_output

    while IFS='' read -r line || [[ -n "$line" ]]; do
        level="$(echo "$line" | sed -E 's/(#+).*/\1/; s/#/  /g; s/^  //')"
        title="$(echo "$line" | sed -E 's/^#+ //')"
        # tr does not do OK the lowercase for non ascii chars, add sed to pipeline -> src https://stackoverflow.com/questions/13381746/tr-upper-lower-with-cyrillic-text
        anchor="$(echo "$title" | tr '[:upper:] ' '[:lower:]-' | sed 's/[[:upper:]]*/\L&/' | tr -d "$INVALID_CHARS")"

        # check new line introduced is not duplicated, if is duplicated, introduce a number at the end
        #   copying doctoc behavior
        temp_output=$output"$level- [$title](#$anchor)\n"
        counter=1
        while true; do
            nlines="$(echo -e $temp_output | wc -l)"
            duplines="$(echo -e $temp_output | sort | uniq | wc -l)"
            if [ $nlines = $duplines ]; then
                break
            fi
            temp_output=$output"$level- [$title](#$anchor-$counter)\n"
            counter=$(($counter + 1))
        done

        output="$temp_output"

        # grep: filter header candidates to be included in toc
        # sed: remove the ignored headers (case: minlevel greater than one) to avoid unnecessary spacing later in level variable assignment
    done <<< "$(grep -E "^#{${MINLEVEL},${MAXLEVEL}} " "$1" | tr -d '\r' | sed "s/^#\{$(($MINLEVEL - 1))\}//g")"

    # when in toc we have two `--` quit one
    output="$(echo "$output" | sed 's/--*/-/g')"

    echo "$output"

}

_insert_toc_to_file() {

    declare toc_text="$2"

    # inspired in doctoc lines
    declare start_toc="<!-- START ${SCRIPT_FILE} generated TOC please keep comment here to allow auto update -->"
    declare info_toc="<!-- DO NOT EDIT THIS SECTION, INSTEAD RE-RUN ${SCRIPT_FILE} TO UPDATE -->"
    declare end_toc="<!-- END ${SCRIPT_FILE} generated TOC please keep comment here to allow auto update -->"

    toc_block="$start_toc\n$info_toc\n## Table of Contents\n\n$toc_text\n$end_toc"

    # temporary replace of '/' (confused with separator of substitutions) and '&' (confused with match regex symbol) to run the special sed command
    utext_ampersand="id8234923000230gzz"
    utext_slash="id9992384923423gzz"
    toc_block="$(echo "$toc_block" | sed "s,\&,$utext_ampersand,g")"
    toc_block="$(echo "$toc_block" | sed "s,\/,$utext_slash,g")"

    # search multiline toc block -> https://stackoverflow.com/questions/2686147/how-to-find-patterns-across-multiple-lines-using-grep/2686705
    # grep color for debugging -> https://superuser.com/questions/914856/grep-display-all-output-but-highlight-search-matches
    if grep --color=always -Pzl "(?s)$start_toc.*\n.*$end_toc" $1 &> /dev/null; then
        # src https://askubuntu.com/questions/533221/how-do-i-replace-multiple-lines-with-single-word-in-fileinplace-replace
        sed -i ":a;N;\$!ba;s/$start_toc.*$end_toc/$toc_block/g" $1
        echo -e "\n  Updated TOC content in $1 succesfully\n"

    else
        sed -i 1i"$toc_block" "$1"
        echo -e "\n  Created TOC in $1 succesfully\n"

    fi

    # undo symbol replacements
    sed -i "s,$utext_ampersand,\&,g" $1
    sed -i "s,$utext_slash,\/,g" $1

}

_process_toc() {
    declare toc_temp_file=$(_setup_tempfile)

    sed '/```/,/```/d' "$README" > "$toc_temp_file"

    declare level=$MINLEVEL
    while [[ $(grep -E "^#{$level} " "$toc_temp_file" | wc -l) -le 1 ]]; do
        level=$(($level + 1))
    done
    if [[ $MINLEVEL -ne $level ]]; then
        echo -e "\nnote: detected all headers (maybe except 1) in level $level, switching to that level of headers to fill table of contents"
    fi
    MINLEVEL=$level
    toc_text=$(_generate_toc "$toc_temp_file")
    rm "$toc_temp_file"

    _insert_toc_to_file "$README" "$toc_text"
}

main() {
    _setup
    _process_sh_files
    _process_toc
}

main "$@"
