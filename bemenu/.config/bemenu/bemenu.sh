#!/bin/zsh
BACKGROUND='#282c34f0'
FOREGROUND='#aab2bfff'
PRIMARY='#61afefff'
SECONDARY='#e06c75ff'
GREEN='#98c379ff'
RED='#e06c75ff'
BLUE='#61afefff'

 bemenu-run \
  --tb $BACKGROUND \
  --tf $PRIMARY \
  --fb $FOREGROUND \
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
  --prompt ">" \
  --border 1 \
  --border-radius 5 \
  --bdr $BACKGROUND \
  --line-height 24
