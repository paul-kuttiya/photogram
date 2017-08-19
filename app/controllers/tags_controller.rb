class TagsController < ApplicationController
  def show
    @posts = Tag.find_by(name: params[:id]).posts
  end
end