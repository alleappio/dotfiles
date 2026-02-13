#!/usr/bin/env bash

status=$(playerctl status 2>/dev/null) || {
    echo ""
    exit 0
}

player=$(playerctl metadata playerName 2>/dev/null)
artist=$(playerctl metadata artist 2>/dev/null)
title=$(playerctl metadata title 2>/dev/null)

echo "$status: $title - $artist"
