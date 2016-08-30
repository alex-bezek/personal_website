# Encoding: utf-8
# frozen_string_literal: true

# The primary base active record all our models can inherit from
class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true
end
