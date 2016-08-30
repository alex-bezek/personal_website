# Encoding: utf-8
# frozen_string_literal: true

# Base application mailer all other mailers can inherit from
class ApplicationMailer < ActionMailer::Base
  default from: 'from@example.com'
  layout 'mailer'
end
