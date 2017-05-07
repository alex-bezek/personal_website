# Encoding: utf-8
# frozen_string_literal: true

# Posts controller to control posted content
class PostsController < ApplicationController
  def index
  end

  def show
    render params[:id].downcase
  end
end
