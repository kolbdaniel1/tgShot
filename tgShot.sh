#!/bin/bash
DATE=$(date +"%Y-%m-%d_%H%M%S")
fswebcam -r 1920x1080  --no-banner /home/pi/photos/$DATE.jpg


now=$(date)
to=$1
tgpath=/home/pi/tg
LOGFILE="/var/log/tg.log"
cd ${tgpath}
(sleep 5; echo "send_photo $to /home/pi/photos/$DATE.jpg"; echo "safe_quit") | /home/pi/tg/bin/telegram-cli -W
echo "$now = $to Recipient Photo  = $DATE.jpg" >> ${LOGFILE}
echo "Finished" >> ${LOGFILE}

