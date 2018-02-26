FROM ubuntu:16.04
MAINTAINER Rabi Narayan Samal <srabinarayan@prokarma.com>
RUN apt-get update
RUN apt-get -yqq install nodejs npm git
RUN ln -s /usr/bin/nodejs /usr/bin/node
RUN useradd -d /home/hubot -m -s /bin/bash -U hubot
ADD . /opt/hubot/pkbot
RUN chown -R hubot:hubot /opt/hubot/pkbot
RUN chmod -R 777 /opt/hubot/pkbot
USER hubot
WORKDIR /opt/hubot/pkbot
ENV HUBOT_ADAPTER=slack
RUN npm install
RUN npm install hubot-slack --save
EXPOSE 6379
ENTRYPOINT /bin/sh /opt/hubot/pkbot/run.sh
