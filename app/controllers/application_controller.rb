class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  helper_method :unmark_notices, :user_notices, :logged_in?, :current_user

  def current_user
    user ||= User.find_by_id(session[:user_id]) if session[:user_id]
  end

  def logged_in?
    !!current_user
  end

  def require_user
    unless logged_in?
      redirect_to login_path
    end
  end

  def user_notices(amount=10)
    current_user.notices.limit(amount)
  end

  def unmark_notices
    current_user.notices.where(mark: false)
  end

  def redirect_signed_in
    redirect_to current_user if logged_in?
  end
end
