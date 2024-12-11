#!/bin/bash

FILE=$(xdg-user-dir PICTURES)/$(date +'%Y-%m-%d-%H%M%S_grim.png')

slurp | grim -g - $FILE
xclip -selection clipboard -t image/png < $FILE
