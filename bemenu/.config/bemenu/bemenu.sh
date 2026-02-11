#!/bin/bash

source "$HOME/.config/bemenu/colors.sh"

 bemenu-run \
  --tb $BACKGROUND \
  --tf $PRIMARY \
  --ff $FOREGROUND \
  --fb $BACKGROUND \
  --cb $BACKGROUND \
  --cf $FOREGROUND \
  --nb $BACKGROUND \
  --nf $FOREGROUND \
  --hb $BACKGROUND \
  --hf $PRIMARY \
  --fbb $BACKGROUND \
  --fbf $FOREGROUND \
  --sb $BACKGROUND \
  --sf $FOREGROUND \
  --ab $BACKGROUND \
  --af $FOREGROUND \
  --scb $BACKGROUND \
  --scf $FOREGROUND \
  --prompt " 󰣇" \
  --border 5 \
  --border-radius 0 \
  --bdr $TRANSPARENT \
  --line-height 20 \
  --margin 5 \
  --ignorecase \
