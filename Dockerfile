FROM alpine:3.5

RUN apk update && apk upgrade && apk add curl wget bash make gcc libc-dev ruby-bigdecimal ruby-json

RUN apk add ruby ruby-bundler ruby-dev

RUN rm -rf /var/cache/apk/*

RUN mkdir /usr/app
WORKDIR /usr/app

COPY Gemfile /usr/app/
COPY Gemfile.lock /usr/app/
RUN bundle install

COPY . /usr/app

CMD ruby bot.rb
