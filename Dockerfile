FROM smikino/ruby-node:2-10-slim

RUN apt-get update -qq && \
  apt-get install -y nano build-essential libpq-dev && \
  gem install bundler

RUN mkdir /project

COPY Gemfile Gemfile.lock /project/
WORKDIR /project
COPY . /project

COPY ./scripts/entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/entrypoint.sh
ENTRYPOINT ["entrypoint.sh"]

ENV BUNDLE_PATH=/bundle \
  BUNDLE_BIN=/bundle/bin \
  GEM_HOME=/bundle
ENV PATH="${BUNDLE_BIN}:${PATH}"

