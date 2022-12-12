FROM ruby:3.1.2-slim

RUN apt-get update -qq && apt-get install -y build-essential libssl-dev libmariadb-dev

WORKDIR /opt

COPY Gemfile .

RUN gem install rails:7.0.3.1 && gem update bundler
RUN bundle install

COPY . .

EXPOSE 3000

ENTRYPOINT rails s

CMD -b 0.0.0.0 -p 3000
