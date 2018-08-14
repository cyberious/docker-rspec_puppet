FROM ruby:2.4.4

MAINTAINER Cyberious

ENV PUPPET_VERSION '~> 5.3.7'

RUN gem install bundler

COPY Gemfile /scripts/Gemfile
COPY spec.sh /scripts/spec.sh
RUN chmod +x /scripts/spec.sh

WORKDIR /scripts/

RUN bundle install

CMD "/scripts/spec.sh"
