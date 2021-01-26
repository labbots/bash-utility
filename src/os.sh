#!/usr/bin/env bash

# @file Operating System
# @brief Functions to detect Operating system and version.

# @description Identify the OS the function is run on.
#
# @noargs
#
# @example
#   os::detect_os
#   #Output
#   linux
#
# @exitcode 0  If OS is successfully detected.
# @exitcode 1 If unable to detect OS.
#
# @stdout Operating system name (linux, mac or windows).
os::detect_os() {
    declare uname os
    uname=$(command -v uname)

    case $("${uname}" | tr '[:upper:]' '[:lower:]') in
    linux*)
        os="linux"
        ;;
    darwin*)
        os="mac"
        ;;
    msys* | cygwin* | mingw* | nt | win*)
        # or possible 'bash on windows'
        os="windows"
        ;;
    *)
        return 1
        ;;
    esac
    printf "%s" "${os}"
}

# @description Identify the distribution flavour of linux.
#
# @noargs
#
# @example
#   os::detect_linux_distro
#   #Output
#   ubuntu
# @exitcode 0  If Linux distro is successfully detected.
# @exitcode 1 If unable to detect OS distro.
#
# @stdout Linux OS distribution name (ubuntu, debian, suse, etc.,).
os::detect_linux_distro() {
    declare distro
    if [[ -f /etc/os-release ]]; then
        # shellcheck disable=SC1091
        . "/etc/os-release"
        distro="${NAME}"
    elif type lsb_release >/dev/null 2>&1; then
        # linuxbase.org
        distro=$(lsb_release -si)
    elif [[ -f /etc/lsb-release ]]; then
        # For some versions of Debian/Ubuntu without lsb_release command
        # shellcheck disable=SC1091
        . /etc/lsb-release
        distro="${DISTRIB_ID}"
    elif [[ -f /etc/debian_version ]]; then
        # Older Debian/Ubuntu/etc.
        distro="debian"
    elif [[ -f /etc/SuSe-release ]]; then
        # Older SuSE/etc.
        distro="suse"
    elif [[ -f /etc/redhat-release ]]; then
        # Older Red Hat, CentOS, etc.
        distro="redhat"
    else
        return 1
    fi
    printf "%s" "${distro}" | tr '[:upper:]' '[:lower:]'
}

# @description Identify the Linux version.
#
# @noargs
#
# @example
#   os::detect_linux_version
#   #Output
#   20.04
#
# @exitcode 0  If Linux version is successfully detected.
# @exitcode 1 If unable to detect Linux version.
#
# @stdout Linux OS version number (18.04, 20.04, etc.,).
os::detect_linux_version() {
    declare distro_version
    if [[ -f /etc/os-release ]]; then
        # shellcheck disable=SC1091
        . "/etc/os-release"
        distro_version="${VERSION_ID}"
    elif type lsb_release >/dev/null 2>&1; then
        # linuxbase.org
        distro_version=$(lsb_release -sr)
    elif [[ -f /etc/lsb-release ]]; then
        # For some versions of Debian/Ubuntu without lsb_release command
        # shellcheck disable=SC1091
        . /etc/lsb-release
        distro_version="${DISTRIB_RELEASE}"
    else
        return 1
    fi
    printf "%s" "${distro_version}"
}

# @description Identify the MacOS version.
#
# @noargs
#
# @example
#   os::detect_linux_version
#   #Output
#   10.15.7
# @exitcode 0  If MacOS version is successfully detected.
# @exitcode 1 If unable to detect MacOS version.
#
# @stdout MacOS version number (10.15.6, etc.,)
os::detect_mac_version() {
    if [[ "$(os::detect_os)" = "mac" ]]; then
        declare mac_version
        mac_version="$(sw_vers -productVersion)"
        printf "%s" "${mac_version}"
    else
        return 1
    fi
}
