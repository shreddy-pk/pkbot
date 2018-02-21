#!/bin/sh
cat /dev/null > startup.log && /opt/hubot/pkbot/bin/hubot & > startup.log 2>&1 && tail -f startup.log
exec "$@"
