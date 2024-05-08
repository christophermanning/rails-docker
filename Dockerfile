FROM alpine:3.19

# install build dependencites
RUN apk add --no-cache build-base

# install ruby
RUN apk add --no-cache ruby ruby-dev

# install sqlite and dependencies
RUN apk add --no-cache sqlite sqlite-dev

# `rails new` dependency
RUN apk add --no-cache git

# psych dependency
RUN apk add --no-cache yaml-dev

# install rails
RUN gem install rails --no-document

# fix nokogiri https://nokogiri.org/tutorials/installing_nokogiri.html#linux-musl-error-loading-shared-library
RUN apk add --no-cache gcompat

# fix sqlite build errors during `rails new`
RUN bundle config force_ruby_platform true

# fix ZoneinfoDirectoryNotFound
RUN apk add --no-cache tzdata

WORKDIR /src
