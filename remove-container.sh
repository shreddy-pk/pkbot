#!/bin/bash
OLDHUBOT="$(docker -H  tcp://192.168.10.235:2376 ps -aq --filter name=hubot)" 
if [ -n "$OLDHUBOT" ]; then   
   docker -H  tcp://192.168.10.235:2376 stop $OLDHUBOT && docker -H  tcp://192.168.10.235:2376 rm $OLDHUBOT
   fi
