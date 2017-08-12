class SessionsController < ApplicationController
  before_action :redirect_signed_in, only: [:new, :create]
  
  def create
    @user = User.find_by(username: params[:username])

    if @user && @user.authenticate(params[:password])
      session[:user_id] = @user.id
      
      flash[:success] = "Welcome back #{@user.username}"
      redirect_to @user
    else
      flash[:danger] = "Wrong username or password!"
      redirect_to login_path
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path
  end
end