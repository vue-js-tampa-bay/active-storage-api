
FROM ruby:2.6.3-alpine
RUN apk add --no-cache --update build-base nodejs postgresql-dev bash tzdata imagemagick nano
RUN mkdir /all-purpose-api
WORKDIR /all-purpose-api
COPY Gemfile /all-purpose-api/Gemfile
COPY Gemfile.lock /all-purpose-api/Gemfile.lock
RUN bundle install
COPY . /all-purpose-api

# Add a script to be executed every time the container starts.
COPY entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/entrypoint.sh
ENTRYPOINT ["entrypoint.sh"]
EXPOSE 3000

# Start the main process.
CMD ["rails", "server", "-b", "0.0.0.0"]
