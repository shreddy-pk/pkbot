FROM centos:latest
RUN yum install -y epel-release && yum -y install nodejs npm git
RUN useradd -ms  /bin/bash hubot
USER hubot

EXPOSE 6379
# Create the directory to contain the Hubot instance
RUN mkdir -p /home/hubot/pkbot
RUN chown -R hubot:hubot /home/hubot/pkbot
RUN chmod 0777 /home/hubot/pkbot
#RUN git clone -b master https://github.com/vishnu4b3/pkbot.git
WORKDIR /home/hubot/pkbot
COPY --chown=hubot bin  /home/hubot/pkbot/bin
COPY --chown=hubot external-scripts.json /home/hubot/pkbot/external-scripts.json
COPY --chown=hubot hubot-scripts.json /home/hubot/pkbot/hubot-scripts.json
COPY --chown=hubot package.json /home/hubot/pkbot/package.json
COPY --chown=hubot Procfile /home/hubot/pkbot/Procfile
COPY --chown=hubot README.md /home/hubot/pkbot/README.md
COPY --chown=hubot scripts /home/hubot/pkbot/scripts
COPY --chown=hubot run.sh /home/hubot/pkbot/run.sh
#RUN chown -R hubot:hubot /home/hubot/pkbot
#RUN chmod 0777 /home/hubot/pkbot
VOLUME /home/hubot/pkbot
#WORKDIR /home/hubot/pkbot
ENV HUBOT_ADAPTER=slack
ENV HUBOT_SLACK_TOKEN=xoxb-316277351014-4hTDsK3Om2TUOxRhuOa8Jnrd
#WORKDIR /home/hubot/pkbot
RUN chmod +x /home/hubot/pkbot/run.sh
RUN ls -l /home/hubot/pkbot/bin/hubot
#ENTRYPOINT ["/home/hubot/pkbot/run.sh"]
