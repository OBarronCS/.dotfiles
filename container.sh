#!/bin/bash


# Exit when any command fails
set -e
# keep track of the last executed command
trap 'last_command=$current_command; current_command=$BASH_COMMAND' DEBUG
# echo an error message before exiting
trap 'echo "\"${last_command}\" command failed with exit code $?."' EXIT

if ! hash sudo 2> /dev/null && whoami | grep -q root; then
    sudo() {
        ${*}
    }
fi

export DEBIAN_FRONTEND=noninteractive

if command -v apt &> /dev/null; then
    sudo apt update
    sudo apt install -y vim git tmux curl wget kitty-terminfo
fi

RED="\e[31m"
GREEN="\e[32m"
YELLOW="\e[33m"
ENDCOLOR="\e[0m"

append_if_missing() {
  local file="$1"
  local line="$2"

  grep -Fxq -- "$line" "$file" 2>/dev/null || echo "$line" >> "$file"
}

function print_info {
    echo "--------------------"
    echo -e "${GREEN}$1${ENDCOLOR}"
    echo "--------------------"
}
