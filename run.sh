#!/bin/bash

export PATH=$PATH:/bin:/usr/local/bin

wineconsole --backend=curses mb_warband_dedicated.exe -r Sample_Battle.txt
echo "Started"