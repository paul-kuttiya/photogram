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
      create_hashtag
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
      #create notice
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

  def create_hashtag
    if @post.has_hashtags?
      @post.hashtags.each do |tag|
        #Validates extra layer both in controller and model
        tag = tag.downcase
        @tag = tag_exists?(tag)
        @tag.posts << @post unless @tag.posts.include?(@post)
      end
    end
  end

  def tag_exists?(tag)
    Tag.exists?(name: tag) ? Tag.find_by(name: tag) : Tag.create(name: tag) 
  end
end