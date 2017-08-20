class RelationshipsController < ApplicationController
  before_action :find_user, only: [:create, :following, :follower]

  def create
    @relationship = Relationship.find_by(leader: @user, follower: current_user)

    if @relationship
      @relationship.destroy
    else
      Relationship.create(leader: @user, follower: current_user)
    end

    @unfollow = !!@relationship

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
end