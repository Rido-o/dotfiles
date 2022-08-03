#!/bin/sh

if [ -s $(pidof dwmblocks) ]; then
    exec dwmblocks &
else
    killall dwmblocks & exec dwmblocks
fi &
exec status-musicupdate &
