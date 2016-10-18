require_relative 'boot'

# Missing   active_record/railtie since we have no database.
# Convert back to require 'rails/all' if needed in the future
require 'rails'
%w(
  action_controller/railtie
  action_view/railtie
  action_mailer/railtie
  active_job/railtie
  action_cable/engine
  rails/test_unit/railtie
  sprockets/railtie
).each do |railtie|
  begin
    require railtie
  rescue LoadError
  end
end

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module PersonalWebsite
  class Application < Rails::Application
  end
end
