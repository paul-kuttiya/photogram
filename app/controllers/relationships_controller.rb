class RelationshipsController < ApplicationController
  def create
    @user = User.find_by(username: params[:user_id])
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
  end

  def followings
  end
end