#!/usr/bin/env bash

#           DO WHAT THE FUCK YOU WANT TO PUBLIC LICENSE
#                    Version 2, December 2004
#  
# Copyright (C) 2004 Sam Hocevar <sam@hocevar.net>
# 
# Everyone is permitted to copy and distribute verbatim or modified
# copies of this license document, and changing it is allowed as long
# as the name is changed.
#  
#            DO WHAT THE FUCK YOU WANT TO PUBLIC LICENSE
#   TERMS AND CONDITIONS FOR COPYING, DISTRIBUTION AND MODIFICATION
# 
#  0. You just DO WHAT THE FUCK YOU WANT TO.


original_dir="$(pwd)"

cd "$(dirname "$0")" || exit

grim -t jpeg screen.jpg

#get logo path, if none random
if [[ "$2" != "" ]]; then
  cd "$original_dir" || exit
  image=$(realpath "$2")
  cd "$(dirname "$0")" || exit
else
  image="icons/$(shuf -i0-2 -n1).png"
fi








#make background image
rm logo-ed_screen.png

# this command is crazy fast, but it gaussian blurs and overlays a logo 
# with a speed that is around 3-4 times faster than the time it takes for
# imagemagick to simply composite that logo (no blurring)
# (test is not done in a controlled environment, but you get the idea)
# I FUCKING LOVE FFMPEG!!
#ffmpeg -i screen.jpg -vf \
  #"[in] gblur=sigma=$1  [blurred]; movie=$image [logo]; 
  #[blurred][logo] overlay=(main_w-overlay_w)/2:(main_h-overlay_h)/2 [out]" \
 # logo-ed_screen.png

#import pywal colors
# shellcheck source=/home/master/.cache/wal/colors.sh
source "$HOME/.cache/wal/colors.sh"

swaylock font=hack font-size=10 color=000000 inside-color=282828 ignore-empty-password daemonize


  
