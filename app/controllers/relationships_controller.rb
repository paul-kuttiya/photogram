class RelationshipsController < ApplicationController
  before_action :find_user, only: [:create, :following, :follower]
  before_action :current_user_page?, only: [:following, :follower]

  def create
    @relationship = Relationship.find_by(leader: @user, follower: current_user)

    if @relationship
      @relationship.destroy
    else
      @follow_notice = Relationship.create(leader: @user, follower: current_user)

      Notice.create_follow_notice(current_user, @user, @follow_notice)
    end

    @unfollow = !!@relationship
    @user_page = params[:user_page] == "true"
    
    respond_to do |format|
      format.html { redirect_to @user }
      format.js
    end
  end

  def follower
    @follows = @user.followers

    respond_to do |format|
      format.html { redirect_to @user }
      format.js
    end
  end

  def following
    @follows = @user.leaders
    
    respond_to do |format|
      format.html { redirect_to @user }
      format.js
    end
  end

  private
  def find_user
    @user = User.find_by(username: params[:user_id])
  end

  def current_user_page?
    @user_page = current_user == @user    
  end
end