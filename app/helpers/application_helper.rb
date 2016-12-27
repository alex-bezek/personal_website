# Encoding: utf-8
# frozen_string_literal: true

# The generic helper for our application
module ApplicationHelper
  def inside_layout(layout, &block)
    layout = "layouts/#{layout}"
    content_for :content, capture(&block)
    render template: layout
  end
end
