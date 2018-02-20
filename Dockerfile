FROM centos:latest

ENTRYPOINT ["/home/hubot/pkbot/bin/hubot"]

RUN yum install -y epel-release && yum -y install nodejs npm
RUN useradd -ms  /bin/bash hubot
USER hubot

EXPOSE 6379
# Create the directory to contain the Hubot instance
RUN mkdir -p /home/hubot/pkbot
RUN chmod 0777 /home/hubot/pkbot
WORKDIR /home/hubot/pkbot
ADD bin  /home/hubot/pkbot/bin
ADD external-scripts.json /home/hubot/pkbot/external-scripts.json
ADD hubot-scripts.json /home/hubot/pkbot/hubot-scripts.json
ADD package.json /home/hubot/pkbot/package.json
ADD Procfile /home/hubot/pkbot/Procfile
ADD README.md /home/hubot/pkbot/README.md
ADD scripts /home/hubot/pkbot/scripts
RUN chmod 0777 /home/hubot/pkbot
VOLUME /home/hubot/pkbot
WORKDIR /home/hubot/pkbot
RUN npm install
RUN npm install hubot-slack --save
RUN export HUBOT_ADAPTER=slack
RUN export HUBOT_SLACK_TOKEN=xoxb-316277351014-4hTDsK3Om2TUOxRhuOa8Jnrd
WORKDIR /home/hubot/pkbot
ENTRYPOINT ["npm install hubot-slack --save", "npm install hubot-slack --save", "export HUBOT_SLACK_TOKEN=xoxb-316277351014-4hTDsK3Om2TUOxRhuOa8Jnrd", "/home/hubot/pkbot/bin/hubot"]
