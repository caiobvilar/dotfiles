#!/bin/sh
# gammastep period-changed hook
# $1=event, $2=old period, $3=new period
# Periods: none, daytime, night, transition

case "$1" in
    period-changed)
        case "$3" in
            daytime)
                ~/.config/sway/theme/day.sh &
                ;;
            night)
                ~/.config/sway/theme/night.sh &
                ;;
        esac
        ;;
esac
