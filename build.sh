set -e
bin/setup

bundle exec rubocop
bundle exec rspec
