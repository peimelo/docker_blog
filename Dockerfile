FROM ruby:2.6.4

LABEL maintainer="peimelo@gmail.com"

RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | \
  apt-key add -
RUN echo "deb https://dl.yarnpkg.com/debian/ stable main" | \
  tee /etc/apt/sources.list.d/yarn.list
RUN apt-get update -yqq && apt-get install -yqq --no-install-recommends \
  nodejs \
  yarn

# Install gems
COPY Gemfile* /usr/src/app/
WORKDIR /usr/src/app
RUN bundle install

# Install yarn packages
COPY package.json yarn.lock /usr/src/app/
RUN yarn install

COPY . /usr/src/app/

CMD ["bin/rails", "s", "-b", "0.0.0.0"]
