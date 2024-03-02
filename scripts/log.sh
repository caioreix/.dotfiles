#!/bin/bash

# Function: einfo(message, [prefix])
einfo() {
    if [ -z "$2" ]; then
        ecustom "$1" cyan INFO
    else
        ecustom "$1" cyan "$2"
    fi
}

# Function: ewarn(message, [prefix])
ewarn() {
    if [ -z "$2" ]; then
        ecustom "$1" yellow WARN
    else
        ecustom "$1" yellow "$2"
    fi
}

# Function: ewarn(message, [prefix])
etrace() {
    if [ -z "$2" ]; then
        ecustom "$1" darkgrey TRACE
    else
        ecustom "$1" darkgrey "$2"
    fi
}

# Function: eerror(message, [prefix])
eerror() {
    if [ -z "$2" ]; then
        ecustom "$1" red ERROR
    else
        ecustom "$1" red "$2"
    fi
}

# Function: estart(message, [prefix])
estart() {
    if [ -z "$2" ]; then
        ecustom "$1" green START
    else
        ecustom "$1" green "$2"
    fi
}

# Function: eend(message, [prefix])
eend() {
    if [ -z "$2" ]; then
        ecustom "$1" purple END
    else
        ecustom "$1" purple "$2"
    fi
}

# Function: ecustom(message, color, prefix)
ecustom() {
    echo "[$(colored "$2" "$3")] $1"
}

# Function: colored(color, message)
colored() {
    BLACK='\033[0;31m'
    WHITE='\033[1;37m'
    RED='\033[0;31m'
    GREEN='\033[0;32m'
    ORANGE='\033[0;33m'
    BLUE='\033[0;34m'
    PURPLE='\033[0;35m'
    CYAN='\033[0;36m'
    YELLOW='\033[1;33m'
    DARKGREY='\033[1;30m'
    NC='\033[0m'

    UPPER=$(eval echo $1 | tr '[a-z]' '[A-Z]')
    COLOR=$(eval echo "\$$UPPER")

    if [ -z "$COLOR" ]; then
        echo -e "$2"
    else
        echo -e "$COLOR$2$NC"
    fi
}

# Black        0;30     Dark Gray     1;30
# Red          0;31     Light Red     1;31
# Green        0;32     Light Green   1;32
# Brown/Orange 0;33     Yellow        1;33
# Blue         0;34     Light Blue    1;34
# Purple       0;35     Light Purple  1;35
# Cyan         0;36     Light Cyan    1;36
# Light Gray   0;37     White         1;37
# No Color     0
