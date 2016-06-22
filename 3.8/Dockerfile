FROM ruby:1.9.3

MAINTAINER Cyberious

ENV PUPPET_VERSION '~> 3.8'
ENV FACTER_VERSION '~> 2.4'

RUN gem install bundler

ADD Gemfile /Gemfile
ADD spec.sh /spec.sh
RUN chmod +x /spec.sh

WORKDIR '/'

RUN bundle install

CMD /spec.sh
