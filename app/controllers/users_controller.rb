class UsersController < ApplicationController
  before_action :redirect_signed_in, only: [:new, :create]

  before_action :require_user, only: [:edit, :update]

  before_action :find_current_user, only: [:edit, :update]

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
    @user = User.find_by(username: params[:id])
    @follow = !current_user.follow?(@user) if current_user
  end

  def update
    if @user.update(user_params)
      flash[:info] = "Update account."
      redirect_to accounts_edit_path
    else
      render :edit
    end
  end
  
  private
  def user_params
    params.require(:user).permit!
  end

  def find_current_user
    @user = User.find_by(username: current_user.username)
  end
end