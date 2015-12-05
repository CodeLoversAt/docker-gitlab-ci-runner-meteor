FROM node:0.12

MAINTAINER Daniel Holzmann <d@velopment.at>

RUN apt-get update \
  && apt-get upgrade -y \
	&& apt-get install -y --no-install-recommends \
		ca-certificates curl graphicsmagick \
		numactl locales \
	&& rm -rf /var/lib/apt/lists/*

RUN curl https://install.meteor.com/ | sh

RUN npm install -g velocity-cli gulp

# fix issue with MongoDB and missing locale
# https://github.com/meteor/meteor/issues/4019
RUN dpkg-reconfigure locales && \
    locale-gen C.UTF-8 && \
    /usr/sbin/update-locale LANG=C.UTF-8

ENV LC_ALL C.UTF-8
