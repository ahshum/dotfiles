#!/bin/sh

xset r rate 250 50
xset s off
xset dpms 0 0 0

xrdb -merge ~/.Xresources

exec i3
