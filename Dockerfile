FROM ruby:3.4

WORKDIR /app

RUN apt-get update -qq && apt-get install -y nodejs postgresql-client libpq-dev

COPY Gemfile Gemfile.lock ./
RUN bundle install

COPY . .

CMD ["rails", "server", "-b", "0.0.0.0"]
