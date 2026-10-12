#!/usr/bin/env bash

cat > ~/.config/fuzzel/fuzzel.ini <<EOF
[main]
font=JetBrainsMono Nerd Font:size=7
prompt= "=> "
terminal=kitty
layer=overlay

width=55
horizontal-pad=20
vertical-pad=12
inner-pad=6

lines=6
line-height=25

[border]
width=1
radius=10

[colors]
$(cat ~/.cache/hellwal/fuzzel-colors.ini)

[dmenu]
exit-immediately-if-empty=no
EOF
