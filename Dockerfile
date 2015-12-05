FROM node:0.12

MAINTAINER Daniel Holzmann <d@velopment.at>

RUN apt-get update \
  && apt-get upgrade -y \
	&& apt-get install -y --no-install-recommends \
		ca-certificates curl graphicsmagick \
		numactl \
	&& rm -rf /var/lib/apt/lists/*

RUN curl https://install.meteor.com/ | sh

RUN npm install -g velocity-cli gulp

VOLUME /root/.meteor
