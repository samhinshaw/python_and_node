# Start from a Python image instead of a Node image
# Reference from: https://hub.docker.com/r/nikolaik/python-nodejs/dockerfile
FROM python:3.7-stretch

#############################
##   Python & Node Setup   ##
#############################

# Install node prereqs, nodejs and yarn
# Ref: https://deb.nodesource.com/setup_8.x
# Ref: https://yarnpkg.com/en/docs/install

RUN apt-get update
RUN apt-get install -yqq apt-transport-https

# Add sources and the public keys
RUN echo "deb https://deb.nodesource.com/node_8.x stretch main" > /etc/apt/sources.list.d/nodesource.list
RUN wget -qO- https://deb.nodesource.com/gpgkey/nodesource.gpg.key | apt-key add -
RUN echo "deb https://dl.yarnpkg.com/debian/ stable main" > /etc/apt/sources.list.d/yarn.list
RUN wget -qO- https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add -

RUN apt-get update
RUN apt-get install -yqq nodejs yarn

# Update pip and install pipenv
RUN pip install -U pip && pip install pipenv

# Install the latest npm 6.x version
RUN npm i -g npm@^6

# remove apt lists
RUN rm -rf /var/lib/apt/lists/*
