#!/bin/bash
revert() {
  rm /tmp/*screen*.png
  xset dpms 0 0 0
}
trap revert HUP INT TERM
xset +dpms dpms 0 0 5
scrot -d 1 /tmp/locking_screen.png
convert -blur 0x6 /tmp/locking_screen.png /tmp/screen_blur.png
convert -composite /tmp/screen_blur.png ~/Pictures/rick_morty_no_bg.png -gravity West -geometry +420x1200 /tmp/screen.png
# for dual monitor
# convert -composite /tmp/screen.png ~/Pictures/rick.png -gravity East -geometry +800x1200 /tmp/screen.png
i3lock -i /tmp/screen.png -u
revert
