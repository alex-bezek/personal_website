# Encoding: utf-8
# frozen_string_literal: true

namespace :assets do
  desc 'prepare our asset pipeline with bourbon, neat, and bitters'
  task bourbon: :environment do
    commands = [
      'rm -rf app/assets/stylesheets/plugins/bourbon',
      'rm -rf app/assets/stylesheets/plugins/neat',
      'rm -rf neat',
      'rm -rf app/assets/stylesheets/base/bitters',
      'rm -rf node_modules',
      'npm install',
      'bundle exec bourbon install --path app/assets/stylesheets/plugins',
      'bundle exec neat install',
      'mv neat app/assets/stylesheets/plugins',
      'bundle exec bitters install --path app/assets/stylesheets/base/bitters'
    ]

    commands.each { |c| IO.popen(c).each { |line| STDOUT.puts line } }
  end
end
