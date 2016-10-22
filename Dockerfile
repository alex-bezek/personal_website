FROM ruby:2.3.1-alpine

# Set any required ENV variables
RUN RAILS_SERVE_STATIC_FILES=true
RUN export RAILS_SERVE_STATIC_FILES

RUN apk update && apk --update add ruby ruby-irb ruby-json ruby-rake \
    ruby-bigdecimal ruby-io-console libstdc++ tzdata nodejs

RUN mkdir /myapp
WORKDIR /myapp
ADD Gemfile /myapp/Gemfile
ADD Gemfile.lock /myapp/Gemfile.lock

RUN apk --update add --virtual build-dependencies build-base ruby-dev openssl-dev \
    libc-dev linux-headers && \
    gem install bundler && \
    cd /myapp ; bundle install && \
    apk del build-dependencies

COPY .nvmrc /myapp
COPY package.json /myapp
RUN npm install

ADD . /myapp

RUN bundle exec rake assets:precompile

RUN chown -R nobody:nogroup /myapp
USER nobody

EXPOSE 3000

CMD ["bundle", "exec", "rails", "server", "-b", "0.0.0.0"]
