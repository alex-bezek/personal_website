FROM ruby:2.3.1-alpine

RUN apk update && apk --update add libstdc++ tzdata nodejs python

RUN mkdir /myapp
WORKDIR /myapp
ADD Gemfile* .nvmrc package.json /myapp/

RUN apk --update add --virtual build-dependencies build-base openssl-dev \
    linux-headers && \
    gem install bundler && \
    bundle install && \
    npm install && \
    apk del build-dependencies build-base openssl-dev

ADD . /myapp

RUN bundle exec rake assets:bourbon
RUN npm run webpack
RUN bundle exec rake assets:precompile

RUN chown -R nobody:nogroup /myapp
USER nobody

EXPOSE 3000

CMD ["bundle", "exec", "rails", "server", "-b", "0.0.0.0"]
