trap "grim -o HDMI-A-1 /tmp/lockscreen_left.png && convert -filter Gaussian -resize 20% -blur 0x2.5 -resize 500% /tmp/lockscreen_left.png /tmp/lockscreen_left.png" EXIT
