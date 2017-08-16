class RelationshipsController < ApplicationController
  def create
    @user = User.find_by(username: params[:user_id])
    
    @relationship = Relationship.find_by(leader: @user, follower: current_user)

    if @relationship
      @relationship.delete
    else
      Relationship.create(leader: @user, follower: current_user)
    end

    redirect_to @user
  end
end