#!/bin/bash
remic=$(pacmd list-cards | grep alsa_input | sed "s/.*#//g" | sed "s/:.*//g")
remicstat=$(pactl get-source-mute $remic)

if [ "$remicstat" = "Mute: yes" ] ; then
    qdbus org.kde.kglobalaccel /component/kmix invokeShortcut "mic_mute" && mplayer /usr/share/sounds/Oxygen-Sys-App-Positive.ogg
    else
       qdbus org.kde.kglobalaccel /component/kmix invokeShortcut "mic_mute" && mplayer /usr/share/sounds/Oxygen-Sys-App-Negative.ogg
fi
