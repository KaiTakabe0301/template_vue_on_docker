FROM node:16.15.0-buster-slim

WORKDIR /usr/src/app

RUN apt-get upgrade

RUN yarn global add @vue/cli

# RUN npm install --save prop-types