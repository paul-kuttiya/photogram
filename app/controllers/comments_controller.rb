class CommentsController < ApplicationController
  before_action :require_user, only: [:create]

  def create
    @comment = Comment.new(description: params["description"], user: current_user, post: get_post)

    if @comment.save
      build_mention

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
        create_mention(@mention_at, current_user, get_post)
        build_notice(current_user, @mention_at, get_post)
      end
    end
  end

  def build_notice(from, to, obj)
    notice = Notice.find_by(from: from, to: to, noticeable: obj)
    Notice.create(from: from, to: to, noticeable: obj) unless notice
  end

  def create_mention(mention_at, mention_by, post)
    mention = Mention.find_by(mention_at: mention_at, mention_by: mention_by, post: post)
    Mention.create(mention_at: mention_at, mention_by: mention_by, post: post) unless mention
  end

  def current_user_mention
    {mention_at: @mention_at, mention_by: current_user, post: get_post}
  end
end