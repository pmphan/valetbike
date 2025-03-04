FROM ruby:3.1.2-slim

RUN apt-get update -qq && apt-get install -y build-essential libssl-dev libmariadb-dev

WORKDIR /opt

RUN bundle config set deployment true

RUN gem install rails:7.0.3.1

COPY Gemfile* .

RUN gem update bundler

RUN bundle install

COPY . .

RUN rails tailwindcss:install

RUN rake assets:precompile

EXPOSE 3000

CMD rails s -b 0.0.0.0 -p 3000
