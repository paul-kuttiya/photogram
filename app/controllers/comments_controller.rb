class CommentsController < ApplicationController
  before_action :require_user, only: [:create]

  def create
    @comment = Comment.new(description: params["description"], user: current_user, post: get_post)

    if @comment.save
      build_mention if @comment.has_mention?
      #notice for all comments
      build_comment_notice

      respond_to do |format|
        format.html do
          redirect_to user_post_path(current_user, @post)
        end

        format.js { }
      end
    else
      flash[:danger] = "something wrong"
      redirect_to [current_user, @post]   
    end
  end

  private
  def get_post
    @post = Post.find_by(token: params[:id])
  end

  def build_mention
    @comment.mention_users.each do |mention|
      @mention_at = User.find_by(username: mention)

      if @mention_at 
        Mention.create_user_mention(@mention_at, current_user, get_post)
        
        build_mention_notice
      end
    end
  end

  # no notice when comment on own post
  def build_comment_notice
    unless current_user == @post.user 
      Notice.create_notice(current_user, @post.user, @comment, get_post)
    end
  end

  # no notice when mention yourself
  def build_mention_notice
    unless current_user == @mention_at 
      Notice.create_notice(current_user, @mention_at, get_post, get_post)
    end
  end
end