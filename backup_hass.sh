#!/bin/bash

CURRENTDATEONLY=`date +"%b %d, %Y"`
cd /home/homeassistant/.homeassistant
git add .
git commit -m "Auto backup ${CURRENTDATEONLY}"
git push origin master

exit
