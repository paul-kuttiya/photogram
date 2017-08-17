class PostsController < ApplicationController
  before_action :require_user, only: [:new, :create, :like]
  before_action :find_post, only: [:show, :like]
  before_action :find_user, only: [:show, :like]

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

  def like
    @like = Vote.find_by(user: current_user, voteable: @post)

    if @like
      @like.destroy
    else
      @like = Vote.create(user: current_user, voteable: @post)
    end
    
    @unlike = @like.destroyed?

    respond_to do |format|
      format.html do
        redirect_to user_post_path(@user, @post)
      end

      format.js 
    end
  end

  private
  def create_post
    params.require(:post).permit!
  end

  def find_post
    @post = Post.find_by(token: params[:id])
  end

  def find_user
    @user = User.find_by(username: params[:user_id])
  end

end