FROM ruby:2.3.1

# Install necessary packages for building gem native extensions
# Nodejs is needed for installing uglifier
RUN apt-get update -qq && apt-get install -y build-essential libpq-dev
RUN curl -sL https://deb.nodesource.com/setup_6.x | bash -
RUN apt-get install -y nodejs

RUN mkdir /myapp
WORKDIR /myapp
ADD Gemfile /myapp/Gemfile
ADD Gemfile.lock /myapp/Gemfile.lock
RUN bundle install
ADD . /myapp

RUN npm install
EXPOSE 3000

RUN RAILS_SERVE_STATIC_FILES=true
RUN export RAILS_SERVE_STATIC_FILES

RUN bundle exec rake assets:precompile
CMD ["bundle", "exec", "rails", "server", "-b", "0.0.0.0"]
