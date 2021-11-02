#!/bin/bash
# Start SSH Agent if it's not already running.
# https://wiki.archlinux.org/title/SSH_keys#ssh-agent
DIR="$HOME/.config" && mkdir -p $DIR
FILENAME="ssh-agent.env"
if ! pgrep -u "$USER" ssh-agent > /dev/null; then
    ssh-agent > "$DIR/$FILENAME"
fi
if [[ ! "$SSH_AUTH_SOCK" ]]; then
    source "$DIR/$FILENAME" >/dev/null
fi
