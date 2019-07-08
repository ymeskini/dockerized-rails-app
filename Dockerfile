FROM smikino/ruby-node:2-10-slim

RUN apt-get update -qq && \
  apt-get install -y nano build-essential libpq-dev && \
  gem install bundler

RUN mkdir /project

COPY Gemfile Gemfile.lock /project/
WORKDIR /project
RUN bundle install
COPY . /project

COPY entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/entrypoint.sh
ENTRYPOINT ["entrypoint.sh"]
