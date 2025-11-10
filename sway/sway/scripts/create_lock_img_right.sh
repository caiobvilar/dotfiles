trap "grim -o DP-1 /tmp/lockscreen_right.png && convert -filter Gaussian -resize 20% -blur 0x2.5 -resize 500% /tmp/lockscreen_right.png /tmp/lockscreen_right.png" EXIT
