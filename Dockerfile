FROM debian:stable-slim

ARG NG_CLI_VERSION=7.0.6

RUN apt-get update
RUN apt-get install -yy wget curl gnupg
RUN curl -sL https://deb.nodesource.com/setup_10.x  | bash - && \
    apt-get update && apt-get install -y nodejs && \
    npm install npm@latest -g \
    npm install -g yarn \
    npm install -g @angular/cli@$NG_CLI_VERSION \
    npm cache clean --force
RUN apt-get install git -y



RUN wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | apt-key add - && \
    echo "deb http://dl.google.com/linux/chrome/deb/ stable main" > /etc/apt/sources.list.d/google.list && \
    apt-get update && \
    apt-get install -y google-chrome-stable xvfb
RUN npm -v
RUN rm -rf /var/lib/apt/lists/*

# FROM mhart/alpine-node:9

# RUN apk update && \
#     apk upgrade && \
#     apk add git
