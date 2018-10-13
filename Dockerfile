ARG RUBY_VERSION

FROM ruby:${RUBY_VERSION}

MAINTAINER Cyberious

ARG PUPPET_VERSION
ENV PUPPET_GEM_VERSION $PUPPET_VERSION

RUN gem install bundler

COPY Gemfile /scripts/Gemfile
COPY spec.sh /scripts/spec.sh
RUN chmod +x /scripts/spec.sh

WORKDIR /scripts/

RUN PUPPET_GEM_VERSION=${PUPPET_VERSION} bundle install

CMD ["sh", "-c", "PUPPET_GEM_VERSION=${PUPPET_VERSION} /scripts/spec.sh"]
