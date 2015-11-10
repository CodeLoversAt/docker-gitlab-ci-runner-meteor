FROM ruby:latest

MAINTAINER Daniel Holzmann <d@velopment.at>

RUN apt-get update && apt-get upgrade -y && apt-get install -y curl

RUN curl https://install.meteor.com/ | sh

RUN gem install dpl
