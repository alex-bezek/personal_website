# TODO: Add Brakeman and bundler-audit
set -e
bin/setup

bundle exec rubocop
bundle exec rspec
docker build -t personal_website .
