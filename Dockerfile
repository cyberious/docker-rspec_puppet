FROM ruby:2.4.4

MAINTAINER Cyberious

ENV PUPPET_GEM_VERSION '~> 5.5.0'

RUN gem install bundler

COPY Gemfile /scripts/Gemfile
COPY spec.sh /scripts/spec.sh
RUN chmod +x /scripts/spec.sh

WORKDIR /scripts/

RUN bundle install

CMD "/scripts/spec.sh"
