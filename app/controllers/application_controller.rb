class ApplicationController < ActionController::Base

  protect_from_forgery with: :exception
  helper_method :current_user, :logged_in?, :authorized?

  def current_user
    if session[:user_id]
      current_user = User.find(session[:user_id])
    else
      current_user = User.new
    end
    current_user
  end

  def logged_in?
    !!current_user.id
  end

  def authorized?
    if !logged_in?
      flash[:authorize] = "You are not logged in!"
      redirect_to login_path
      false
    else
      true
    end
  end

  def authorized_for(user_id)
    if authorized? && current_user.id != user_id.to_i
      flash[:authorize] = "You are not allowed to view that page!"
      redirect_to current_user
    end
  end

end
