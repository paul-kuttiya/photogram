class UsersController < ApplicationController
  before_action :redirect_signed_in, only: [:new, :create]
  before_action :require_user, only: [:edit]

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

  def edit
    @user = find_user(id: current_user.id)
  end

  def update
    @user = find_user(id: current_user.id)

    if @user.update(user_params)
      flash[:success] = "Profile updated."
      redirect_to accounts_edit_path
    else
      render :edit
    end
  end

  private
  def user_params
    params.require(:user).permit!
  end

  def user_password
    params.require(:password).permit!
  end

  def find_user(options={})
    @user = User.find_by(options)
  end
end