FROM node:0.10

MAINTAINER Daniel Holzmann <d@velopment.at>

RUN apt-get update \
  && apt-get upgrade -y \
	&& apt-get install -y --no-install-recommends \
		ca-certificates curl graphicsmagick \
		numactl locales bzip2 build-essential python git \
	&& rm -rf /var/lib/apt/lists/*

RUN curl https://install.meteor.com/ | sh

# upgrade NPM itself
RUN npm -g install npm@latest-2

RUN npm install -g velocity-cli gulp phantomjs node-gyp

ENV JASMINE_BROWSER PhantomJS
ENV PORT 3000
ENV JASMINE_MIRROR_PORT 5000

# fix issue with MongoDB and missing locale
# https://github.com/meteor/meteor/issues/4019
RUN dpkg-reconfigure locales && \
    locale-gen C.UTF-8 && \
    /usr/sbin/update-locale LANG=C.UTF-8

ENV LC_ALL C.UTF-8

EXPOSE 5000
EXPOSE 3000
EXPOSE 3001
