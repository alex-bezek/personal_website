# Encoding: utf-8
# frozen_string_literal: true

namespace :assets do
  desc 'prepare our asset pipeline with bourbon, neat, and bitters'
  task bourbon: :environment do
    puts 'Removing existing asset plugins'
    `rm -rf app/assets/stylesheets/plugins/bourbon`
    `rm -rf app/assets/stylesheets/plugins/neat`
    `rm -rf neat`
    `rm -rf app/assets/stylesheets/base/bitters`
    `rm -rf node_modules`
    puts 'Please wait, npm install can be slow'
    puts `npm install`
    puts 'Time to install our gem assets'
    puts `bundle exec bourbon install --path app/assets/stylesheets/plugins`
    puts `bundle exec neat install`
    `mv neat app/assets/stylesheets/plugins`
    puts `bundle exec bitters install --path app/assets/stylesheets/base/bitters`
    puts 'All done!!! Take a sip and enjoy the bourbon'
  end
end
