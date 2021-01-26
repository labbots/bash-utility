#!/usr/bin/env bash

# @file Validation
# @brief Functions to perform validation on given data.

# @description Validate whether a given input is a valid email address or not.
#
# @example
#   test='test@gmail.com'
#   validation::email "${test}"
#   echo $?
#   #Output
#   0
#
# @arg $1 string input email address to validate.
#
# @exitcode 0  If provided input is an email address.
# @exitcode 1  If provided input is not an email address.
# @exitcode 2 Function missing arguments.
validation::email() {
    [[ $# = 0 ]] && printf "%s: Missing arguments\n" "${FUNCNAME[0]}" && return 2
    declare email_re
    email_re="^([A-Za-z]+[A-Za-z0-9]*\+?((\.|\-|\_)?[A-Za-z]+[A-Za-z0-9]*)*)@(([A-Za-z0-9]+)+((\.|\-|\_)?([A-Za-z0-9]+)+)*)+\.([A-Za-z]{2,})+$"
    [[ "${1}" =~ ${email_re} ]] && return 0 || return 1
}

# @description Validate whether a given input is a valid IP V4 address.
#
# @example
#   ips='
#        4.2.2.2
#        a.b.c.d
#        192.168.1.1
#        0.0.0.0
#        255.255.255.255
#        255.255.255.256
#        192.168.0.1
#        192.168.0
#        1234.123.123.123
#        0.192.168.1
#        '
#   for ip in $ips; do
#      if validation::ipv4 $ip; then stat='good'; else stat='bad'; fi
#      printf "%-20s: %s\n" "$ip" "$stat"
#   done
#   #Output
#   4.2.2.2             : good
#   a.b.c.d             : bad
#   192.168.1.1         : good
#   0.0.0.0             : good
#   255.255.255.255     : good
#   255.255.255.256     : bad
#   192.168.0.1         : good
#   192.168.0           : bad
#   1234.123.123.123    : bad
#   0.192.168.1         : good
#
# @arg $1 string input IPv4 address.
#
# @exitcode 0  If provided input is a valid IPv4.
# @exitcode 1  If provided input is not a valid IPv4.
# @exitcode 2 Function missing arguments.
validation::ipv4() {
    [[ $# = 0 ]] && printf "%s: Missing arguments\n" "${FUNCNAME[0]}" && return 2
    declare ip="${1}"
    declare IFS=.
    # shellcheck disable=SC2206
    declare -a a=($ip)
    [[ "${ip}" =~ ^[0-9]+(\.[0-9]+){3}$ ]] || return 1
    # Test values of quads
    declare quad
    for quad in {0..3}; do
        [[ "${a[$quad]}" -gt 255 ]] && return 1
    done
    return 0
}

# @description Validate whether a given input is a valid IP V6 address.
#
# @example
#   ips='
#        2001:db8:85a3:8d3:1319:8a2e:370:7348
#        fe80::1ff:fe23:4567:890a
#        fe80::1ff:fe23:4567:890a%eth2
#        2001:0db8:85a3:0000:0000:8a2e:0370:7334:foo:bar
#        fezy::1ff:fe23:4567:890a
#        ::
#        2001:db8::
#        '
#   for ip in $ips; do
#     if validation::ipv6 $ip; then stat='good'; else stat='bad'; fi
#     printf "%-50s= %s\n" "$ip" "$stat"
#   done
#   #Output
#   2001:db8:85a3:8d3:1319:8a2e:370:7348              = good
#   fe80::1ff:fe23:4567:890a                          = good
#   fe80::1ff:fe23:4567:890a%eth2                     = good
#   2001:0db8:85a3:0000:0000:8a2e:0370:7334:foo:bar   = bad
#   fezy::1ff:fe23:4567:890a                          = bad
#   ::                                                = good
#   2001:db8::                                        = good
#
# @arg $1 string input IPv6 address.
#
# @exitcode 0  If provided input is a valid IPv6.
# @exitcode 1  If provided input is not a valid IPv6.
# @exitcode 2 Function missing arguments.
validation::ipv6() {
    [[ $# = 0 ]] && printf "%s: Missing arguments\n" "${FUNCNAME[0]}" && return 2

    declare ip="${1}"
    declare re="^(([0-9a-fA-F]{1,4}:){7,7}[0-9a-fA-F]{1,4}|([0-9a-fA-F]{1,4}:){1,7}:|\
([0-9a-fA-F]{1,4}:){1,6}:[0-9a-fA-F]{1,4}|([0-9a-fA-F]{1,4}:){1,5}(:[0-9a-fA-F]{1,4}){1,2}|\
([0-9a-fA-F]{1,4}:){1,4}(:[0-9a-fA-F]{1,4}){1,3}|([0-9a-fA-F]{1,4}:){1,3}(:[0-9a-fA-F]{1,4}){1,4}|\
([0-9a-fA-F]{1,4}:){1,2}(:[0-9a-fA-F]{1,4}){1,5}|[0-9a-fA-F]{1,4}:((:[0-9a-fA-F]{1,4}){1,6})|\
:((:[0-9a-fA-F]{1,4}){1,7}|:)|fe80:(:[0-9a-fA-F]{0,4}){0,4}%[0-9a-zA-Z]{1,}|\
::(ffff(:0{1,4}){0,1}:){0,1}((25[0-5]|(2[0-4]|1{0,1}[0-9]){0,1}[0-9])\.){3,3}(25[0-5]|\
(2[0-4]|1{0,1}[0-9]){0,1}[0-9])|([0-9a-fA-F]{1,4}:){1,4}:((25[0-5]|\
(2[0-4]|1{0,1}[0-9]){0,1}[0-9])\.){3,3}(25[0-5]|(2[0-4]|1{0,1}[0-9]){0,1}[0-9]))$"

    [[ "${ip}" =~ $re ]] && return 0 || return 1
}

# @description Validate if given variable is entirely alphabetic characters.
#
# @example
#   test='abcABC'
#   validation::alpha "${test}"
#   echo $?
#   #Output
#   0
#
# @arg $1 string Value of variable to validate.
#
# @exitcode 0  If input is only alpha characters.
# @exitcode 1 If input contains any non alpha characters.
# @exitcode 2 Function missing arguments.
validation::alpha() {
    [[ $# = 0 ]] && printf "%s: Missing arguments\n" "${FUNCNAME[0]}" && return 2

    declare re='^[[:alpha:]]+$'
    if [[ "${1}" =~ $re ]]; then
        return 0
    fi
    return 1
}

# @description Check if given variable contains only alpha-numeric characters.
#
# @example
#   test='abc123'
#   validation::alpha_num "${test}"
#   echo $?
#   #Output
#   0
#
# @arg $1 string Value of variable to validate.
#
# @exitcode 0  If input is an alpha-numeric.
# @exitcode 1 If input is not an alpha-numeric.
# @exitcode 2 Function missing arguments.
validation::alpha_num() {
    [[ $# = 0 ]] && printf "%s: Missing arguments\n" "${FUNCNAME[0]}" && return 2

    declare re='^[[:alnum:]]+$'
    if [[ "${1}" =~ $re ]]; then
        return 0
    fi
    return 1
}

# @description Validate if given variable contains only alpha-numeric characters, as well as dashes and underscores.
#
# @example
#   test='abc-ABC_cD'
#   validation::alpha_dash "${test}"
#   echo $?
#   #Output
#   0
#
# @arg $1 string Value of variable to validate.
#
# @exitcode 0  If input is valid.
# @exitcode 1 If input the input is not valid.
# @exitcode 2 Function missing arguments.
validation::alpha_dash() {
    [[ $# = 0 ]] && printf "%s: Missing arguments\n" "${FUNCNAME[0]}" && return 2

    declare re='^[[:alpha:]_-]+$'
    if [[ "${1}" =~ $re ]]; then
        return 0
    fi
    return 1
}

# @description Compares version numbers and provides return based on whether the value in equal, less than or greater.
#
# @arg $1 string Version number to check (eg: 1.0.1)
# $arg $2 string Version number to check (eg: 1.0.1)
#
# @example
#   test='abc-ABC_cD'
#   validation::version_comparison "12.0.1" "12.0.1"
#   echo $?
#   #Output
#   0
#
# @exitcode 0 version number is equal.
# @exitcode 1 $1 version number is greater than $2.
# @exitcode 2 $1 version number is less than $2.
# @exitcode 3 Function is missing required arguments.
# @exitcode 4 Provided input argument is in invalid format.
validation::version_comparison() {
    [[ $# -lt 2 ]] && printf "%s: Missing arguments\n" "${FUNCNAME[0]}" && return 3

    declare regex="^[.0-9]*$"
    ! [[ $1 =~ $regex ]] && printf "Invalid argument: %s \n" "${1}" && return 4
    ! [[ $2 =~ $regex ]] && printf "Invalid argument invalid: %s \n" "${2}" && return 4

    if [[ "$1" == "$2" ]]; then
        return 0
    fi
    declare IFS=.
    declare -a ver1 ver2
    read -r -a ver1 <<<"${1}"
    read -r -a ver2 <<<"${2}"
    # fill empty fields in ver1 with zeros
    for ((i = ${#ver1[@]}; i < ${#ver2[@]}; i++)); do
        ver1[i]=0
    done
    for ((i = 0; i < ${#ver1[@]}; i++)); do
        if [[ -z ${ver2[i]} ]]; then
            # fill empty fields in ver2 with zeros
            ver2[i]=0
        fi
        if ((10#${ver1[i]} > 10#${ver2[i]})); then
            return 1
        fi
        if ((10#${ver1[i]} < 10#${ver2[i]})); then
            return 2
        fi
    done
    return 0
}
