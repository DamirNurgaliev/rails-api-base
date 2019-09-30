######################
# Stage: Builder
FROM ruby:2.5.1-alpine as Builder

RUN apk add --update --no-cache build-base postgresql-dev

WORKDIR /app

COPY Gemfile* /app/
RUN bundle install -j4 --retry 3 \
 # Remove unneeded files (cached *.gem, *.o, *.c)
 && rm -rf /usr/local/bundle/cache/*.gem \
 && find /usr/local/bundle/gems/ -name "*.c" -delete \
 && find /usr/local/bundle/gems/ -name "*.o" -delete

# Add the Rails app
COPY . /app/

###############################
# Stage Final
FROM ruby:2.5.1-alpine
LABEL maintainer="damir.nurgalievv@gmail.com"

# Add Alpine packages
RUN apk add --update --no-cache postgresql-client tzdata

# Add user
RUN addgroup -g 1000 -S app && adduser -u 1000 -S app -G app
USER app

# Copy app with gems from former build stage
COPY --from=Builder --chown=app:app /usr/local/bundle/ /usr/local/bundle/
COPY --from=Builder --chown=app:app /app/ /app/

WORKDIR /app

# Add a script to be executed every time the container starts.
COPY --chown=app:app bin/docker-entrypoint /usr/bin/
RUN chmod +x /usr/bin/docker-entrypoint
ENTRYPOINT ["docker-entrypoint"]

# Expose Server port
EXPOSE 3000

# Set Rails env
ENV RAILS_LOG_TO_STDOUT true

# Start up
CMD ["bundle", "exec", "rails", "server"]
