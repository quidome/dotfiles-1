#!/bin/bash

artist=$(mpc -f %artist% | head -n1)
song=$(mpc -f %title% | head -n1)
album=$(mpc -f %album% | head -n1)
notify-send "<b>$song</b>" "$artist - $album"
