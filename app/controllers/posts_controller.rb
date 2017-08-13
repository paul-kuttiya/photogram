class PostsController < ApplicationController
  def new
    @post = Post.new
  end

  def create
    @post = Post.new(create_post.merge!(user: current_user))

    if @post.save
      redirect_to user_post_path(current_user, @post)
    else
      render :new
    end
  end

  def show
    @post = Post.find_by(token: params[:id])
  end

  def edit
  end

  private
  def create_post
    params.require(:post).permit!
  end
end