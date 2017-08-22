class CommentsController < ApplicationController
  before_action :require_user, only: [:create]

  def create
    @comment = Comment.new(description: params["description"], user: current_user, post: get_post)

    if @comment.save
      build_mention
      Notice.create_notice(current_user, @post.user, @comment)

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
    if @comment.has_mention?
      @comment.mention_users.each do |mention|
        @mention_at = User.find_by(username: mention)
        Mention.create_user_mention(@mention_at, current_user, get_post)
        # if user is_friend? with mention user
        # notice mention
      end
    end
  end
end