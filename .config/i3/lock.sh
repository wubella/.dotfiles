#!/bin/bash
#TMPBG=$HOME/screen.png
#BG=$HOME/.background.png
#LOCK=$HOME/.config/i3/lock.png
#RES=$(xrandr | grep 'current' | sed -E 's/.*current\s([0-9]+)\sx\s([0-9]+).*/\1x\2/')
#echo $RES

 
#ffmpeg -i $BG -vf scale=$RES -i $LOCK -filter_complex hstack $TMPBG 
#ffmpeg -i $BG -i $LOCK -filter_complex "[0:v]scale=1920:-1,crop=1920:1080:0:(in_h-out_h)/2+15:exact=1[bg];[1:v]scale=-1:30[ovrl];[bg][ovrl]overlay=86-overlay_w/2:1003-overlay_h/2" $TMPBG 

#ffmpeg -i $BG -i $LOCK -filter_complex "[0:v]scale=1920:-1,crop=1920:1080:0:(in_h-out_h)/2+15:exact=1[bg];[1:v]scale=100:100[ovrl];[bg][ovrl]overlay=(main_w-overlay_w)/2:(main_h-overlay_h)/2" $TMPBG 

#-i $LOCK -filter_complex "boxblur=5:1,overlay=(main_w-overlay_w)/2:(main_h-overlay_h)/2" -vframes 1 $TMPBG -loglevel quiet
#i3lock -i $TMPBG \
#    --insidecolor=373445ff --ringcolor=e9e9e9ff --line-uses-inside \
#    --keyhlcolor=81a2beff --bshlcolor=f0c674ff --separatorcolor=00000000 \
#    --insidevercolor=b5bd68ff --insidewrongcolor=cc6666ff \
#    --ringvercolor=e9e9e9ff --ringwrongcolor=e9e9e9ff --indpos="x+86:y+1003" \
#    --radius=15 --veriftext="" --wrongtext="" --noinputtext=""
i3lock -c 111111 \
    --radius=1 --indpos="0:-10" \
    --veriftext="verifying..." --verifpos="1:28" \
    --wrongtext="Login incorrect" --wrongpos="1:28" \
    --noinputtext="" \
    --greetertext="Password:" --greeterpos="1:14" \
    --greeter-font=Cousine --greetersize=12 --greetercolor=e9e9e9ff --greeter-align=1 \
    --verif-font=Cousine --verifsize=12 --verifcolor=e9e9e9ff --verif-align=1\
    --wrong-font=Cousine --wrongsize=12 --wrongcolor=e9e9e9ff --wrong-align=1\
   


#rm $TMPBG
