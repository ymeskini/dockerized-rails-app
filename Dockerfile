FROM smikino/ruby-node:2-10-alpine

RUN apk add --no-cache build-base \
  postgresql-dev \
  bash \
  && gem install bundler

RUN mkdir /project
WORKDIR /project
COPY Gemfile Gemfile.lock project/
COPY ./ project/

COPY ./scripts/entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/entrypoint.sh
ENTRYPOINT ["entrypoint.sh"]

ENV BUNDLE_PATH=/bundle \
  BUNDLE_BIN=/bundle/bin \
  GEM_HOME=/bundle
ENV PATH="${BUNDLE_BIN}:${PATH}"

