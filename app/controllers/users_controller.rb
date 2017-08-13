class UsersController < ApplicationController
  before_action :redirect_signed_in, only: [:new, :create]

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      session[:user_id] = @user.id
      flash[:info] = "Welcome to Photogram #{@user.username}!"
      
      redirect_to @user
    else
      render :new
    end
  end

  def show
    @user = find_user(username: params[:id])
  end

  private
  def user_params
    params.require(:user).permit!
  end

  def find_user(options={})
    @user = User.find_by(options)
  end
end