#!/bin/bash

# Terminate already running bar instances
killall -q polybar
# If all your bars have ipc enabled, you can also use
polybar-msg cmd quit
# Wait until all polybar instances are terminated 
while pgrep -x polybar >/dev/null; do sleep 1; done

# Launch bars
polybar -q workspace &
polybar -q workspace2 &
polybar -q launch &
polybar -q power &
polybar -q date &
polybar -q vol &
polybar -q spotify &

