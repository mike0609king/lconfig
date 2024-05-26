#!/usr/bin/env bash

# Terminate already running bar instances
killall -q polybar

# Wait until the processes have been shut sown
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

# uncomment to launch on all screens
if type "xrandr"; then
  for m in $(xrandr --query | grep " connected" | cut -d" " -f1); do
    MONITOR=$m polybar --reload example &
  done
else
  polybar --reload example &
fi

echo "Bars Launched..."
