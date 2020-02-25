FROM ruby:2.6.5

LABEL maintainer="peimelo@gmail.com"

# Allow apt to work with https-based sources
RUN apt-get update -yqq && apt-get install -yqq --no-install-recommends \
  apt-transport-https

# Ensure we install an up-to-date version of Node
# See https://github.com/yarnpkg/yarn/issues/2888
RUN curl -sL https://deb.nodesource.com/setup_12.x | bash -

# Ensure latest packages for Yarn
RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add -
RUN echo "deb https://dl.yarnpkg.com/debian/ stable main" | \
  tee /etc/apt/sources.list.d/yarn.list -

RUN apt-get update -yqq && apt-get install -yqq --no-install-recommends \
  nodejs \
  yarn

# Install gems
COPY Gemfile* /usr/src/app/
WORKDIR /usr/src/app
RUN bundle install

# Install yarn packages
COPY package.json yarn.lock /usr/src/app/
RUN yarn install --check-files

COPY . /usr/src/app/

CMD ["bin/rails", "s", "-b", "0.0.0.0"]
