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
      send_notice_to_followers

      redirect_to user_post_path(current_user, @post)
    else
      render :new
    end
  end

  def like
    @like = Vote.find_by(user: current_user, voteable: @post)

    #unlike
    if @like && @like.vote?
      @like.update(vote: false)
    else
      create_new_like
    end
  
    @unlike = !@like.vote?

    respond_to do |format|
      format.html do
        redirect_to user_post_path(@user, @post)
      end

      format.js 
    end
  end

  private
  def is_user_page?
    current_user == @user
  end

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
        @tag = Tag.find_or_create_new(tag.downcase)
        #Validates both in controller and model
        @tag.posts << @post unless @tag.posts.include?(@post)
      end
    end
  end

  def create_new_like
    if @like.nil? #new like
      @like = Vote.create(user: current_user, voteable: @post)
      Notice.create_notice(current_user, @post.user, @like, @post) unless is_user_page?
    else #re-like after unlike
      @like.update(vote: true)
    end
  end

  def send_notice_to_followers
    current_user.followers.each do |follower|
      Notice.create_notice(current_user, follower, @post, @post)
    end
  end
end