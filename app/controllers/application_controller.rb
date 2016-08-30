# Encoding: utf-8
# frozen_string_literal: true

# The primary base controller all our controllers will inherit from
class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
end
