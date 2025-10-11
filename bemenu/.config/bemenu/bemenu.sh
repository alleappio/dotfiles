#!/bin/bash
BACKGROUND='#282828f0'
FOREGROUND='#ebdbb2ff'
PRIMARY='#458588ff'
SECONDARY='#cc241dff'
GREEN='#98971aff'
RED='#cc241dff'
BLUE='#458588ff'

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
  --prompt " " \
  --border 1 \
  --border-radius 5 \
  --bdr $BACKGROUND \
  --line-height 24 \
  --margin 5
