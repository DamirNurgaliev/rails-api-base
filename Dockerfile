FROM ruby:2.6.3

RUN apt-get update -qq && apt-get install -y build-essential libpq-dev

ENV APP_HOME /rails-api-base
RUN mkdir $APP_HOME
WORKDIR $APP_HOME

COPY Gemfile /$APP_HOME/Gemfile
COPY Gemfile.lock /$APP_HOME/Gemfile.lock

RUN bundle install

COPY . /$APP_HOME
